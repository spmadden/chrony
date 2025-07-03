-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.7-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.7.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.5.5-2~) [amd64 arm64 armel armhf hppa i386 loong64 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 7a59427bb96df4b1d443cf6eb5bea9e95a6b071f 644610 chrony_4.7.orig.tar.gz
 7af5af8f3d9a0a24aa81f095268c1a190b8f0a31 52860 chrony_4.7-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b 644610 chrony_4.7.orig.tar.gz
 ff3cae9d6b790c11e2a54b950022719945c72f05223213f1466ee6529a0837b1 52860 chrony_4.7-1ubuntu1.debian.tar.xz
Files:
 a1ab6e972527a9cbf6bf862679352ed3 644610 chrony_4.7.orig.tar.gz
 4a3ac5115a7dfa8968eb30dabe34dfd8 52860 chrony_4.7-1ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEco7DU8UfXhRO0oCBM4dveyhIiTsFAmhmhjgACgkQM4dveyhI
iTvJbA/7BrdTTgryUHbcoyG4eH2gD/RSPGMstPKjZyS5jDQQRD+4t48J9s/Ekw0c
AGX4SyLCgOCtHD3JD+2KHfjSs1XuWqyDXoW7Nxv2o2/KREQKw+vkaiyOme5Zx4AR
QjEIsIKZ6eHJPc0T11VzXH87AIb2yGSW3zgjJw1GzNRAPVc1QrCQAT0LKj8lyAO4
bJRTkgMYpbyapGTs0NdMTsRt3Qu0MZ/d0LqVdvvlpOL5aTIoZ1gBiOvisGHlL2JC
24oU5PltNWLBoqFOmS5gc6dbe/sh8di4SSsEaD8Abr4CB4unOUO+9YOGurDj3w8g
MTum+M1d5uHXwjT/CV9UervwzGc3u6Mv+BjTE65L05t1tjQFszc8iqEp7KV1Wyq2
wpP/FJ/BSYIRjCCnvO9h35KNCMdmYipQPmp9k3q4HxsPgfAfguIr61VMosHE8Rlh
DBkA4SeexfC8Yn3824215IOcpIisgoRRpcGvEu7E5irfof9LE73D1JtQiRG9U6sb
h9gsH8Jas/bjtBnV6zzC9wb+nkNKV5gklkpWhiFHoVSGg7V2Z3I24xDRehParOBx
5yaW4tPjckCmHLOkDVKKm6eyTF5GB/i9DZb7B4IoUFIWwvgaPqn07ZESGFwj2DYj
sASdAy6wIzxWTTQ+rZF8jClyeVlvdvvYUqgocB8bBq2RUYiWrHQ=
=9ZNH
-----END PGP SIGNATURE-----
