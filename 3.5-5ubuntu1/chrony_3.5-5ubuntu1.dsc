-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-5ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.4.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 d6dee1ae5ec6f2630d112decad5b7ec0fd4a92b3 39412 chrony_3.5-5ubuntu1.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 f974d68d56403b3551d4effbbda1b8b4e8e97f94276ab97712273cb1d034fd88 39412 chrony_3.5-5ubuntu1.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 7cc21dba6002546a3072604152abb107 39412 chrony_3.5-5ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiGZB1jWM2kalbBxyrJg+tb9ry6kFAl4pp90ACgkQrJg+tb9r
y6lGaQ//S/aq5A8gaH4yydqErLrT2/1aXsri98p7YD1Q9unli7ADnzG60tvnev28
in3tZJbrB32KTdAEnfSrgvE61AmfCVGZF2868Zplfv/tF2XpZjCSdpnzMdM4rZnl
DFb++cKWi/h0A27Z0EEaqKqEi/nsFZRyw3FS4V57KpDhpTgxqpNbiny/l6M9ZeLn
J2SlrHO2sYxPDe3a0ZOs3QLgR2xnlw7Ev/uoaJ8erp1Jlsfru75XudAcAHHsg2jY
KnSbOzuDtiC3ePyzlIvLT439aDAiMVqVqWiWRlc5C14wftXpzWT2mbcJpyGAHl1x
YMw9Pe/bSG8PNYHgksaZCr7e+opv9epFlbVZ6VtWsQtboLSGIvqDObn2GEAdvb9c
f4v5fEkrlaaoeGAKgzjJC9/pDyOguQTalXDI2WqHdkt9TfPHwg/fFNxDYOiisnee
8/ySkGYcB9QLCZNNjxOPIat777O1/ZVx//3q/kMkueGqqqkNx/8ChfMujehGQD93
2JVgSfwpCYqgc1L/4OKW9sbrrQPKWN5sEO00LBiALtB+dm1kiVhOcaoOJOPY7Hhu
cUrMpBVOZQ/GNnMwLbXWZJpnhe09mULQo9WfGyurBkFdGJ+bzu5hrbvs+gPSk25e
rcfUOnu8voGyE3su9QX1YgUwHCS5qaLbFhNzA9sDQuAnWwSn+0U=
=2n+d
-----END PGP SIGNATURE-----
