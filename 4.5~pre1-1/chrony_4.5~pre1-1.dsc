-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 28a3e8669355b302afec2d81e3c4ef090516b181 619825 chrony_4.5~pre1.orig.tar.gz
 fba8d5e1b0a989b61a091b7c7c98432c63cde0a8 833 chrony_4.5~pre1.orig.tar.gz.asc
 88b788281a1ef3c288f86877014759c2f1cf8d8c 40916 chrony_4.5~pre1-1.debian.tar.xz
Checksums-Sha256:
 4bc29f51ee0b4d781c9fcdaa7843fd9465bb8e682d90b5ea20c2f515bdc55c23 619825 chrony_4.5~pre1.orig.tar.gz
 5df69e1e6e3d3e20c1acaec46955fe868ad9ac90eae4478550d8f3355a929b32 833 chrony_4.5~pre1.orig.tar.gz.asc
 ba099d932c04d39b0ed12724129a9c32e8762703178b247f02e5d40205a448c9 40916 chrony_4.5~pre1-1.debian.tar.xz
Files:
 0d976f5e2f7a20ee5de232ea53eb8fbf 619825 chrony_4.5~pre1.orig.tar.gz
 293c9c69bda0cbe73387fdf5a6fb0a2b 833 chrony_4.5~pre1.orig.tar.gz.asc
 78591c359df84996956a89ae898affc6 40916 chrony_4.5~pre1-1.debian.tar.xz
Dgit: 15c0b1e38d577dadd47f802b3fc4b6fa1f6b867b debian archive/debian/4.5_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmVfGhYACgkQnFyZ6wW9
dQow1Af/cGZsFZryWYyTTVYgJXs44Js8YUpqEz+gGRJXSJZofuSvMOUrQRIIjoQK
y7f2YZyfFUB5IIm4MHezaggoFustQNt7eEHPWPcHUw/ZZcLyrqqm3q8476MAHvvh
FyIK0/rrkqS76W9xDuc8nrmKpl9exmDelRghC5IQxDHJQCyYTOlzkYXvDU2H1BUf
P6/sNTb6JOr4JQ0fazsTq2btXl4f0aOW5S2Mbna8Q8P2E01B2y8IU2irHcCxGl8W
KBDh2Ix+cBMY8otCYuyvLBGoCHlX4vWKDDBim6xwSlFWOh6g6VVIn2NWhrH25cyC
uDiXWXoohc7tHJH+Hid3BcQoMmri3Q==
=2DFw
-----END PGP SIGNATURE-----
