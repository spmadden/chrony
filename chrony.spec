Name:           chrony
Version:        1.25
Release:        1%{?gitpatch}%{?dist}
Summary:        An NTP client/server

Group:          System Environment/Daemons
License:        GPLv2
URL:            http://chrony.tuxfamily.org
Source0:        http://download.tuxfamily.org/chrony/chrony-%{version}%{?prerelease}.tar.gz
Source1:        chrony.conf
Source2:        chrony.keys
Source3:        chronyd.service
Source4:        chronyd.init
Source5:        chrony.logrotate
# wget -O timepps.h 'http://gitweb.enneenne.com/?p=linuxpps;a=blob_plain;f=Documentation/pps/timepps.h;hb=b895b1a28558b83907c691aad231c41a0d14df88'
Source6:        timepps.h
Source7:        chrony.nm-dispatcher
Source8:        chrony.dhclient
%{?gitpatch:Patch0: chrony-%{version}-%{gitpatch}.patch.gz}
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  libcap-devel libedit-devel bison texinfo

Requires(pre):  shadow-utils
Requires(post): chkconfig info
Requires(preun): chkconfig initscripts info
Requires(postun): initscripts

%description
A client/server for the Network Time Protocol, this program keeps your
computer's clock accurate. It was specially designed to support
systems with intermittent internet connections, but it also works well
in permanently connected environments. It can use also hardware reference
clocks, system real-time clock or manual input as time references.

%prep
%setup -q -n %{name}-%{version}%{?prerelease}
mkdir pps; cp -p %{SOURCE6} pps
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
export CPPFLAGS="-Ipps"
export LDFLAGS="-Wl,-z,relro,-z,now"

%configure --docdir=%{_docdir} --enable-forcednsretry
make %{?_smp_mflags} getdate all docs

%install
rm -rf $RPM_BUILD_ROOT

make install install-docs DESTDIR=$RPM_BUILD_ROOT

rm -rf $RPM_BUILD_ROOT%{_docdir}

mkdir -p $RPM_BUILD_ROOT{%{_sysconfdir}/{sysconfig,logrotate.d},%{_initrddir}}
mkdir -p $RPM_BUILD_ROOT%{_localstatedir}/{lib,log}/chrony
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/NetworkManager/dispatcher.d
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/dhcp/dhclient.d
mkdir -p $RPM_BUILD_ROOT/lib/systemd/system

install -m 644 -p %{SOURCE1} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.conf
install -m 640 -p %{SOURCE2} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.keys
install -m 644 -p %{SOURCE3} $RPM_BUILD_ROOT/lib/systemd/system/chronyd.service
install -m 755 -p %{SOURCE4} $RPM_BUILD_ROOT%{_initrddir}/chronyd
install -m 644 -p %{SOURCE5} $RPM_BUILD_ROOT%{_sysconfdir}/logrotate.d/chrony
install -m 755 -p %{SOURCE7} \
        $RPM_BUILD_ROOT%{_sysconfdir}/NetworkManager/dispatcher.d/20-chrony
install -m 755 -p %{SOURCE8} \
        $RPM_BUILD_ROOT%{_sysconfdir}/dhcp/dhclient.d/chrony.sh

touch $RPM_BUILD_ROOT%{_localstatedir}/lib/chrony/{drift,rtc}

%clean
rm -rf $RPM_BUILD_ROOT

%pre
getent group chrony > /dev/null || /usr/sbin/groupadd -r chrony
getent passwd chrony > /dev/null || /usr/sbin/useradd -r -g chrony \
       -d %{_localstatedir}/lib/chrony -s /sbin/nologin chrony
:

%post
/sbin/chkconfig --add chronyd
/sbin/chkconfig chronyd &> /dev/null &&
        /bin/systemctl enable chronyd.service &> /dev/null ||
        /bin/systemctl daemon-reload &> /dev/null
/sbin/install-info  %{_infodir}/chrony.info.gz %{_infodir}/dir &> /dev/null
:

%preun
if [ "$1" -eq 0 ]; then
        /sbin/service chronyd stop &> /dev/null
        /sbin/chkconfig --del chronyd
        /bin/systemctl disable chronyd.service &> /dev/null
        /sbin/install-info --delete %{_infodir}/chrony.info.gz \
                %{_infodir}/dir &> /dev/null
fi
:

%postun
if [ "$1" -ge 1 ]; then
        /sbin/service chronyd condrestart &> /dev/null
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
%{_initrddir}/chronyd
%{_bindir}/chronyc
%{_sbindir}/chronyd
%{_infodir}/chrony.info*
/lib/systemd/system/chronyd.service
%{_mandir}/man[158]/%{name}*.[158]*
%dir %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/drift
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/rtc
%dir %attr(-,chrony,chrony) %{_localstatedir}/log/chrony

%changelog
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
