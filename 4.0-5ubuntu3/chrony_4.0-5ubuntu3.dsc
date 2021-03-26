-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-5ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 e109fb9895eed74d3371a6ee5865a19a4bee4379 43076 chrony_4.0-5ubuntu3.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 2d9469f0e65335d693925d0519adcfc8556f6ad59daa517b15e6f772864973e0 43076 chrony_4.0-5ubuntu3.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 2b40a9b578a2dcbe301b99aed19ad182 43076 chrony_4.0-5ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmBdefYACgkQuj4pM4KA
skKMag//e7G0OYH8jQTzjfd8HAfbxTkIz8ry/xYkqB3aG8SnBzDqsYsua18bEkIQ
LTgYu+e1YVapebUx+72V6BuOLHmGMtmdz2DSKMV1PxpQoFUXsP8ozIYuJozxXW9O
pmdYIHs/07442GJcoP19mC/hFTFBFYqV4TpWSjoKTtEV5jReyN3wkNMdTSh8iJhE
iH4V2mZ6uEhRvc4BVt18mgJWoZvwizk4eQw49PeqBXM8geV4MC2KuKhEqdhMIca8
yvd/O/r/AT7MekUuu/z0FGpJbqNym72YlJYrqvH0be8UibtSy6VQi+CM2OWBizdV
pG00wDgMSax4IbNdFD7y+UzdgkMxad6nUAzqGoOgO37xEC8NAD2JEocGDQ8U0Nwa
jx48yr2GGLvLJeszyWESGcxuw98jApBM4ple1rlvC21YwqLBsA4JKn859mD1Fxv2
qI0wy9hl2cZm1XgNPMyg787AC6g8myBlpS58ZnA3661vDoQAPKvQI8pFY/qP8grW
KWo4fa5UDLnkkBRhzED9YVxmgQ/Nm5u9KQA0tv1pn4N1pvUkaPuwd5hf0TjvxHk5
J3hiqpwalpp/vUuWRfrymqEmdMxUZJ5Tk+hY93s4/8L467uZYFgHh3YuMRuaC7k1
sM2CKDm998fQ9HDLvG08s4GE71fTVoRPE3NUux+LTdBbNkzY12g=
=ui1r
-----END PGP SIGNATURE-----
