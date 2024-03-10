-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 670e55e0d330951d4d8fac2ae79f45bd035b2544 47112 chrony_4.5-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 98882a601e860d0648096052228f60d5f3a6e96394e878419467488719cedde5 47112 chrony_4.5-1ubuntu2.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 b64ad70d3a96d57c1214899fb1017e40 47112 chrony_4.5-1ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQJOBAEBCgA4FiEErEg/aN5yj0PyIC/KVo0w8yGyEz0FAmXtFMkaHHN0ZXZlLmxh
bmdhc2VrQHVidW50dS5jb20ACgkQVo0w8yGyEz3pDw/7B2yC7UjaooKzqWlcx+fl
nfr1MTPcvvT6yoHqzj41WtqFH6k9LU+K+nRjuOOPCpcML0e9GPxAbAC9muCW1Odx
ze3uK4sa9oyaQOjkR70+obFcOLvinU7MqsD+lRmi4qGocTBpnxaucIkSafxIWeyW
+7TgxmPuT1lDSZuzEewiAY9Cjb41VlisutWwVpwE71+xTFHw/ZhICF1VxhalCMk5
91W4BpkUQML+ARKaVqb0qUIedLEZGl12R2rEwVzDX2EFMEq6LOmCYELbCu04W0tg
hppjXg3/HPGSVF40mBhibWabKmQ0rPXEi30kRKqkjTQTDW2bulmRZF5yb52YT3rJ
Texe20NBdYDNSZQrpOOVfEWJPMD7LK6wk9/evDrm+7T/LXB67gW7FSZ1Mank3LME
zrdMShUjuLoiS/AZp/l29u7LfdGQbq1XVs23U+3+5MFO2Ge3H5f4KfrjmX8+XE6y
xI18PJ/l98scXzJ33q6fnEp479X5p3wXxmQ3neOnDg52emPVUgEpyezqg5IgKujy
Q4nihjVEVJN6+Hcphwi4BxsB1tKI1as95ZEQv+ZNHvH9HDlXtAzKUl++Lk9ELEnT
GjzO9VHlUUkC5GbBUH24Aa+bbFn24DkMZ/cDhkBf9L2EXVpGoCzmxw7QcmhradY5
H674S4rB4j1JTYv9gQDAMZM=
=KFS2
-----END PGP SIGNATURE-----
