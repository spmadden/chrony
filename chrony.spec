Summary: An NTP client/server
Name: chrony
Version: 1.24
Release: 1
Source: chrony-%{version}.tar.gz
Copyright: GPL
Group: Applications/Utilities
Packager: Richard P. Curnow <rc@rc0.org.uk>
BuildRoot: %{_tmppath}/%{name}-%{version}-root-%(id -u -n)
Requires: info

%description
A pair of programs for keeping computer clocks accurate.  chronyd is a
background (daemon) program and chronyc is a command-line interface to it.
Time reference sources for chronyd can be RFC1305 NTP servers, human (via
keyboard and chronyc), and the computer's real-time clock at boot time (Linux
only).  chronyd can determine the rate at which the computer gains or loses
time and compensate for it whilst no external reference is present.  chronyd's
use of NTP servers can be switched on and off (through chronyc) to support
computers with dial-up/intermittent access to the Internet. chronyd can also
act as an RFC1305-compatible NTP server.

%prep
%setup

%build
./configure --prefix=%{_prefix} --mandir=%{_mandir}
make CC=gcc CFLAGS=-O2 prefix=%{_prefix}
make chrony.txt prefix=%{_prefix}
make chrony.info prefix=%{_prefix}

%install
rm -rf $RPM_BUILD_ROOT
cd $RPM_BUILD_DIR/chrony-%{version}
make install DESTDIR=$RPM_BUILD_ROOT prefix=%{_prefix}
mkdir -p $RPM_BUILD_ROOT%{_infodir}
cp chrony.info* $RPM_BUILD_ROOT%{_infodir}

%files
%{_sbindir}/chronyd
%{_bindir}/chronyc
%{_infodir}/chrony.info*
%{_mandir}/man1/chrony.1.gz
%{_mandir}/man1/chronyc.1.gz
%{_mandir}/man5/chrony.conf.5.gz
%{_mandir}/man8/chronyd.8.gz
%doc README
%doc chrony.txt
%doc COPYING
%doc examples/chrony.conf.example
%doc examples/chrony.keys.example

