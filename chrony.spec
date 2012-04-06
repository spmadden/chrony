%define prerelease -pre1
Name:           chrony
Version:        1.27
Release:        0.2.pre1%{?gitpatch:.%{gitpatch}}%{?dist}
Summary:        An NTP client/server

Group:          System Environment/Daemons
License:        GPLv2
URL:            http://chrony.tuxfamily.org
Source0:        http://download.tuxfamily.org/chrony/chrony-%{version}%{?prerelease}.tar.gz
Source1:        chrony.conf
Source2:        chrony.keys
Source3:        chronyd.service
Source4:        chrony.helper
Source5:        chrony.logrotate
Source7:        chrony.nm-dispatcher
Source8:        chrony.dhclient
Source9:        chrony-wait.service
%{?gitpatch:Patch0: chrony-%{version}-%{gitpatch}.patch.gz}
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  libcap-devel libedit-devel nss-devel pps-tools-devel bison texinfo

Requires(pre):  shadow-utils
Requires(post): systemd-units info chkconfig
Requires(preun): systemd-units info
Requires(postun): systemd-units

%description
A client/server for the Network Time Protocol, this program keeps your
computer's clock accurate. It was specially designed to support
systems with intermittent internet connections, but it also works well
in permanently connected environments. It can use also hardware reference
clocks, system real-time clock or manual input as time references.

%prep
%setup -q -n %{name}-%{version}%{?prerelease}
%{?gitpatch:%patch0 -p1}

%{?gitpatch: echo %{version}-%{gitpatch} > version.txt}

%build
CFLAGS="$RPM_OPT_FLAGS"
%ifarch %{sparc}
CFLAGS="$CFLAGS -pie -fPIE"
%else
CFLAGS="$CFLAGS -pie -fpie"
%endif
export CFLAGS
export LDFLAGS="-Wl,-z,relro,-z,now"

%configure \
        --docdir=%{_docdir} \
        --with-sendmail=%{_sbindir}/sendmail
make %{?_smp_mflags} getdate all docs

%install
rm -rf $RPM_BUILD_ROOT

make install install-docs DESTDIR=$RPM_BUILD_ROOT

rm -rf $RPM_BUILD_ROOT%{_docdir}

mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/{sysconfig,logrotate.d}
mkdir -p $RPM_BUILD_ROOT%{_localstatedir}/{lib,log}/chrony
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/NetworkManager/dispatcher.d
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/dhcp/dhclient.d
mkdir -p $RPM_BUILD_ROOT%{_libexecdir}
mkdir -p $RPM_BUILD_ROOT/lib/systemd/system

install -m 644 -p %{SOURCE1} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.conf
install -m 640 -p %{SOURCE2} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.keys
install -m 644 -p %{SOURCE3} $RPM_BUILD_ROOT/lib/systemd/system/chronyd.service
install -m 755 -p %{SOURCE4} $RPM_BUILD_ROOT%{_libexecdir}/chrony-helper
install -m 644 -p %{SOURCE5} $RPM_BUILD_ROOT%{_sysconfdir}/logrotate.d/chrony
install -m 755 -p %{SOURCE7} \
        $RPM_BUILD_ROOT%{_sysconfdir}/NetworkManager/dispatcher.d/20-chrony
install -m 755 -p %{SOURCE8} \
        $RPM_BUILD_ROOT%{_sysconfdir}/dhcp/dhclient.d/chrony.sh
install -m 644 -p %{SOURCE9} \
        $RPM_BUILD_ROOT/lib/systemd/system/chrony-wait.service

touch $RPM_BUILD_ROOT%{_localstatedir}/lib/chrony/{drift,rtc}

%clean
rm -rf $RPM_BUILD_ROOT

%pre
getent group chrony > /dev/null || /usr/sbin/groupadd -r chrony
getent passwd chrony > /dev/null || /usr/sbin/useradd -r -g chrony \
       -d %{_localstatedir}/lib/chrony -s /sbin/nologin chrony
:

%post
/bin/systemctl daemon-reload &> /dev/null
/sbin/install-info %{_infodir}/chrony.info.gz %{_infodir}/dir &> /dev/null
:

%triggerun -- chrony < 1.25
if /sbin/chkconfig --level 3 chronyd; then
        /bin/systemctl enable chronyd.service &> /dev/null
fi
:

%preun
if [ "$1" -eq 0 ]; then
        /bin/systemctl --no-reload disable \
                chrony-wait.service chronyd.service &> /dev/null
        /bin/systemctl stop chrony-wait.service chronyd.service &> /dev/null
        /sbin/install-info --delete %{_infodir}/chrony.info.gz \
                %{_infodir}/dir &> /dev/null
fi
:

%postun
/bin/systemctl daemon-reload &> /dev/null
if [ "$1" -ge 1 ]; then
        /bin/systemctl try-restart chronyd.service &> /dev/null
fi
:

%files
%defattr(-,root,root,-)
%doc COPYING NEWS README chrony.txt faq.txt examples/*
%config(noreplace) %{_sysconfdir}/chrony.conf
%config(noreplace) %verify(not md5 size mtime) %attr(640,root,chrony) %{_sysconfdir}/chrony.keys
%config(noreplace) %{_sysconfdir}/logrotate.d/chrony
%{_sysconfdir}/NetworkManager/dispatcher.d/20-chrony
%{_sysconfdir}/dhcp/dhclient.d/chrony.sh
%{_bindir}/chronyc
%{_sbindir}/chronyd
%{_libexecdir}/chrony-helper
%{_infodir}/chrony.info*
/lib/systemd/system/chrony*.service
%{_mandir}/man[158]/%{name}*.[158]*
%dir %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/drift
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/rtc
%dir %attr(-,chrony,chrony) %{_localstatedir}/log/chrony

%changelog
* Fri Apr 06 2012 Miroslav Lichvar <mlichvar@redhat.com> 1.27-0.2.pre1
  use systemctl is-active instead of status in chrony-helper (#794771)

* Tue Feb 28 2012 Miroslav Lichvar <mlichvar@redhat.com> 1.27-0.1.pre1
- update to 1.27-pre1
- generate SHA1 command key instead of MD5

* Wed Feb 15 2012 Miroslav Lichvar <mlichvar@redhat.com> 1.26-6.20110831gitb088b7
- remove old servers on DHCP update (#787042)

* Fri Feb 10 2012 Miroslav Lichvar <mlichvar@redhat.com> 1.26-5.20110831gitb088b7
- improve chrony-helper to keep track of servers added from DHCP (#787042)
- fix dhclient script to always return with zero exit code (#767859)

* Thu Jan 12 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.26-4.20110831gitb088b7
- Rebuilt for https://fedoraproject.org/wiki/Fedora_17_Mass_Rebuild

* Tue Sep 06 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.26-3.20110831gitb088b7
- update to git snapshot 20110831gitb088b7
- on first start generate password with 16 chars
- change systemd service type to forking
- add forced-command to chrony-helper (#735821)

* Mon Aug 15 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.26-2
- fix iburst with very high jitters and long delays
- use timepps header from pps-tools-devel

* Wed Jul 13 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.26-1
- update to 1.26
- read options from sysconfig file if it exists

* Fri Jun 24 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.26-0.1.pre1
- update to 1.26-pre1
- fix service name in %%triggerun
- drop SysV init script
- add chrony-wait service

* Fri May 06 2011 Bill Nottingham <notting@redhat.com> 1.25-2
- fix systemd scriptlets for the upgrade case

* Wed May 04 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.25-1
- update to 1.25

* Wed Apr 20 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.25-0.3.pre2
- update to 1.25-pre2
- link with -Wl,-z,relro,-z,now options

* Tue Feb 08 2011 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.25-0.2.pre1
- Rebuilt for https://fedoraproject.org/wiki/Fedora_15_Mass_Rebuild

* Tue Feb 01 2011 Miroslav Lichvar <mlichvar@redhat.com> 1.25-0.1.pre1
- update to 1.25-pre1
- use iburst, four pool servers, rtcsync, stratumweight in default config
- add systemd support
- drop sysconfig file 
- suppress install-info errors

* Thu Apr 29 2010 Miroslav Lichvar <mlichvar@redhat.com> 1.24-4.20100428git73d775
- update to 20100428git73d775
- replace initstepslew directive with makestep in default config
- add NetworkManager dispatcher script
- add dhclient script
- retry server/peer name resolution at least once to workaround
  NetworkManager race condition on boot
- don't verify chrony.keys

* Fri Mar 12 2010 Miroslav Lichvar <mlichvar@redhat.com> 1.24-3.20100302git5fb555
- update to snapshot 20100302git5fb555
- compile with PPS API support

* Thu Feb 04 2010 Miroslav Lichvar <mlichvar@redhat.com> 1.24-1
- update to 1.24 (#555367, CVE-2010-0292 CVE-2010-0293 CVE-2010-0294)
- modify default config
  - step clock on start if it is off by more than 100 seconds
  - disable client log
- build with -fPIE on sparc

* Tue Dec 15 2009 Miroslav Lichvar <mlichvar@redhat.com> 1.24-0.1.pre1
- update to 1.24-pre1

* Fri Jul 24 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.23-7.20081106gitbe42b4
- Rebuilt for https://fedoraproject.org/wiki/Fedora_12_Mass_Rebuild

* Fri Jul 17 2009 Miroslav Lichvar <mlichvar@redhat.com> 1.23-6.20081106gitbe42b4
- switch to editline
- support arbitrary chronyc commands in init script

* Mon Jun 08 2009 Dan Horak <dan[at]danny.cz> 1.23-5.20081106gitbe42b4
- add patch with support for s390/s390x

* Mon Mar 09 2009 Miroslav Lichvar <mlichvar@redhat.com> 1.23-4.20081106gitbe42b4
- fix building with broken libcap header (#483548)

* Mon Feb 23 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.23-3.20081106gitbe42b4
- Rebuilt for https://fedoraproject.org/wiki/Fedora_11_Mass_Rebuild

* Wed Nov 19 2008 Miroslav Lichvar <mlichvar@redhat.com> 1.23-2.20081106gitbe42b4
- fix info uninstall
- generate random command key in init script
- support cyclelogs, online, offline commands in init script
- add logrotate script

* Tue Nov 11 2008 Miroslav Lichvar <mlichvar@redhat.com> 1.23-1.20081106gitbe42b4
- initial release
