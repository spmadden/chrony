-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5.1-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 3decde1c1d56e87d89b34cba662266a945453b3a 459902 chrony_3.5.1.orig.tar.gz
 8baad9562deb66fbc893234ce892b37d7b417f84 41976 chrony_3.5.1-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7 459902 chrony_3.5.1.orig.tar.gz
 0b22d33735b42a5f0f1bc55838a3180c43c494c8dbcadc94a0129ad554dc9a07 41976 chrony_3.5.1-1ubuntu2.debian.tar.xz
Files:
 1dfc70ae8fd18f0456101b7a91b30234 459902 chrony_3.5.1.orig.tar.gz
 f77f230b0c230c5fa6618b099858a833 41976 chrony_3.5.1-1ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl+FNOUACgkQuj4pM4KA
skJyRg//edogw0mMttUOMCUeBtadJwqt34W3MR46zUXM1bIeQyQd5YH9JPs/uP3m
Jb2vfeQeAqtZ81wA58xX5OdOJgpIpTQxuRHpLwXYoDh+t69O3GcXEyKkQeSIQ7Qf
eh69OMbc0If/re9uWrKLou1EwNBLpcbAu6M97NHf/RNJZagy0qNEMRbgWDVstOvV
JvdC2QhzBU/7Ljf8yy0Ukjyx/AErkbJSCwjPG1xwXidRHE8ufjtY5BJq+RtGAVsk
BczRwmY8qVe/P4tYPqVtc9PUDPdygWl+z2gKHrcbEkPEmAL1M3I5wA9OmFLZvZMQ
gLkezffKyqTWTI+xcJWwRppyIChnbn2zbvkbpQFdH1+Lhy0lk4nAXwCDw7J7Rucy
SxdGfrYVpGW0CN04aqjrHpe1f/K6SfvM9d4Za1xX3t4D3T257dn9t0+N3W5gEc6m
QwXeNMyv3yxFVA6b+DbYRYGd57W+CPskreGeJPDWSmRML0dZXpStv/o7StJtKSat
aJARBwtP/SalXRTl8HbBpWWZGhGec+I8zzIU61voWnHjw2FofsHsBGXaf53V0CAS
C0pND5nvu4KCaoqKqPg24chMulYaNhNl3jGH2pckL0FjMd3PZ+iXsyVrEVcufua3
fctZvev1liLtYHtMm0j4SH+4KNqr7l2HymqpaNhHT2HlBI+GHs4=
=JDS9
-----END PGP SIGNATURE-----
