Name:           chrony
Version:        1.24
Release:        3.20100302git5fb555%{?dist}
Summary:        An NTP client/server

Group:          System Environment/Daemons
License:        GPLv2
URL:            http://chrony.tuxfamily.org
Source0:        http://download.tuxfamily.org/chrony/chrony-%{version}%{?prerelease}.tar.gz
Source1:        chrony.conf
Source2:        chrony.keys
Source3:        chronyd.sysconfig
Source4:        chronyd.init
Source5:        chrony.logrotate
# wget -O timepps.h 'http://gitweb.enneenne.com/?p=linuxpps;a=blob_plain;f=Documentation/pps/timepps.h;hb=b895b1a28558b83907c691aad231c41a0d14df88'
Source6:        timepps.h
Patch0:         chrony-1.24-git5fb555.patch.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  libcap-devel libedit-devel bison texinfo

Requires(pre):  shadow-utils
Requires(post): /sbin/chkconfig /sbin/install-info
Requires(preun): /sbin/chkconfig /sbin/service /sbin/install-info
Requires(postun): /sbin/service

%description
A client/server for the Network Time Protocol, this program keeps your
computer's clock accurate. It was specially designed to support
systems with dial-up Internet connections, and also supports computers
in permanently connected environments. 

%prep
%setup -q -n %{name}-%{version}%{?prerelease}
mkdir pps; cp -p %{SOURCE6} pps
%patch0 -p1

%build
CFLAGS="$RPM_OPT_FLAGS"
%ifarch %{sparc}
CFLAGS="$CFLAGS -pie -fPIE"
%else
CFLAGS="$CFLAGS -pie -fpie"
%endif
export CFLAGS
export CPPFLAGS="-Ipps"

%configure --docdir=%{_docdir}
make %{?_smp_mflags} getdate all docs

%install
rm -rf $RPM_BUILD_ROOT

make install install-docs DESTDIR=$RPM_BUILD_ROOT

rm -rf $RPM_BUILD_ROOT%{_docdir}

mkdir -p $RPM_BUILD_ROOT{%{_sysconfdir}/{sysconfig,logrotate.d},%{_initrddir}}
mkdir -p $RPM_BUILD_ROOT%{_localstatedir}/{lib,log}/chrony

install -m 644 -p %{SOURCE1} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.conf
install -m 640 -p %{SOURCE2} $RPM_BUILD_ROOT%{_sysconfdir}/chrony.keys
install -m 644 -p %{SOURCE3} $RPM_BUILD_ROOT%{_sysconfdir}/sysconfig/chronyd
install -m 755 -p %{SOURCE4} $RPM_BUILD_ROOT%{_initrddir}/chronyd
install -m 644 -p %{SOURCE5} $RPM_BUILD_ROOT%{_sysconfdir}/logrotate.d/chrony

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
/sbin/install-info  %{_infodir}/chrony.info.gz %{_infodir}/dir
:

%preun
if [ "$1" -eq 0 ]; then
        /sbin/service chronyd stop &> /dev/null
        /sbin/chkconfig --del chronyd
        /sbin/install-info --delete %{_infodir}/chrony.info.gz %{_infodir}/dir
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
%config(noreplace) %attr(640,root,chrony) %{_sysconfdir}/chrony.keys
%config(noreplace) %{_sysconfdir}/sysconfig/chronyd
%config(noreplace) %{_sysconfdir}/logrotate.d/chrony
%{_initrddir}/chronyd
%{_bindir}/chronyc
%{_sbindir}/chronyd
%{_infodir}/chrony.info*
%{_mandir}/man[158]/%{name}*.[158]*
%dir %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/drift
%ghost %attr(-,chrony,chrony) %{_localstatedir}/lib/chrony/rtc
%dir %attr(-,chrony,chrony) %{_localstatedir}/log/chrony

%changelog
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
