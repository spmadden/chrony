Name:           chrony
Version:        1.23
Release:        3.20081106gitbe42b4%{?dist}
Summary:        An NTP client/server

Group:          System Environment/Daemons
License:        GPLv2
URL:            http://chrony.sunsite.dk
Source0:        http://chrony.sunsite.dk/download/chrony-%{version}.tar.gz
Source1:        chrony.conf
Source2:        chrony.keys
Source3:        chronyd.sysconfig
Source4:        chronyd.init
Source5:        chrony.logrotate
# taken from GNU tar-1.13 
Source6:        getdate.y
Patch1:         chrony-1.23-gitbe42b4.patch
Patch2:         chrony-1.23-ppc.patch
Patch3:         chrony-1.23-gethost.patch
Patch4:         chrony-1.23-res.patch
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  libcap-devel readline-devel bison texinfo

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
%setup -q
cp -p %{SOURCE6} .
%patch1 -p1
%patch2 -p1 -b .ppc
%patch3 -p1 -b .gethost
%patch4 -p1 -b .res

# don't link with ncurses
sed -i 's|-lncurses||' configure

%build
bison -o getdate.c getdate.y

export CFLAGS="$RPM_OPT_FLAGS -pie -fpie"
# configure doesn't support --bindir --sbindir options, install manually
./configure --enable-linuxcaps
make %{?_smp_mflags} all docs

%install
rm -rf $RPM_BUILD_ROOT

mkdir -p $RPM_BUILD_ROOT{%{_bindir},%{_sbindir}}
mkdir -p $RPM_BUILD_ROOT{%{_infodir},%{_mandir}/man{1,5,8}}
mkdir -p $RPM_BUILD_ROOT{%{_sysconfdir}/{sysconfig,logrotate.d},%{_initrddir}}
mkdir -p $RPM_BUILD_ROOT%{_localstatedir}/{lib,log}/chrony

install -m 755 chronyc $RPM_BUILD_ROOT%{_bindir}
install -m 755 chronyd $RPM_BUILD_ROOT%{_sbindir}
install -m 644 -p -t $RPM_BUILD_ROOT%{_infodir} chrony.info*
install -m 644 -p -t $RPM_BUILD_ROOT%{_mandir}/man1 chrony*.1
install -m 644 -p -t $RPM_BUILD_ROOT%{_mandir}/man5 chrony*.5
install -m 644 -p -t $RPM_BUILD_ROOT%{_mandir}/man8 chrony*.8

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
* Mon Feb 23 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 1.23-3.20081106gitbe42b4
- Rebuilt for https://fedoraproject.org/wiki/Fedora_11_Mass_Rebuild

* Wed Nov 19 2008 Miroslav Lichvar <mlichvar@redhat.com> 1.23-2.20081106gitbe42b4
- fix info uninstall
- generate random command key in init script
- support cyclelogs, online, offline commands in init script
- add logrotate script

* Tue Nov 11 2008 Miroslav Lichvar <mlichvar@redhat.com> 1.23-1.20081106gitbe42b4
- initial release
