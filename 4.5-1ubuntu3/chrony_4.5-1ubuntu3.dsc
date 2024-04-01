-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu3
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
 c3d8a4ce3bd6b62fb317b6a5912680c52ebfa2f0 47176 chrony_4.5-1ubuntu3.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 8e31e6b3df7948ff74aeea3b0093c732b1c1d2bc78ccaa1633b37e59425e837d 47176 chrony_4.5-1ubuntu3.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 fc1f0c112532c4e911a91b928ca2dffc 47176 chrony_4.5-1ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEoIn7Nqr72tWswTJQafeQFxohCYQFAmYKSEIACgkQafeQFxoh
CYQ0gRAAgGktT69O/bNOEamQvUfrJtESduY3LylGJ44W5euYK4/6ksL3l2Dj5L80
rVwIhHj6l8AJI7rDneuwZcqLvFvlHcqaWb1iSYLnHndU/p/v1m7PdylX8O0cS319
vGuHTwtXc8ev0kJ8u+4HEG89xA4eV6TwOtVCG0Jrxi+o03CqT1fr/het/UTlKTSC
66zBnO8q2brPOwAubGjSzv66rSWkxGv+LqC5ZahXczay1xNH2H5ry187CdE8sM9l
0f7C1gU98FFM3XBpxmKsxDOHVQVjbvS7la1kMFVFBUxoEIAsVQI79He5qADhki7E
OMR7hBQVYln6PDfj+r+1NsmcS4Hnd9NBSMeRWxnwE7zQT547GCpEZu9EkbN2r8pE
RI5Esj+obJ7VNY704K1Y/I/IjSyHwdiN/BbfYo1x+eHA+WtrGtU0FTtiX56fDcWK
zO6BDwYSevEt9++Ny9biwzOtWr7ij9TMULJgb/hZpevAkF/y80bu+MqAFSjIebwi
0hh1nC3Y1b0C7DPRcPuV92oJrOviqPrjPNGKEnhSos1KAMx1mRmifwcHkRVUyjQT
NS+nQ3njJFO64o5D5Z4OpCzHwN/jsPmTm9iMu3YOjn+ZeIZhF5WC3EwAsWYhzJya
uDLkZqzimbEFES5I0BsiQrtADncohBD6ptI2iOdvTAiDIkygvbE=
=3Y5F
-----END PGP SIGNATURE-----
