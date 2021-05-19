-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 15dc1976653f17d290b65007a4779e3f4ac1833e 564648 chrony_4.1.orig.tar.gz
 2884869313f7f9221f76f92005e41672395cf221 44352 chrony_4.1-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 8cd5f150cf7a56306528b78d2d0296c6dcef0b26b667346e9fee8649faa55cb5 44352 chrony_4.1-1ubuntu1.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 a18c8b5bdcf5115ae39584eaeb4c0997 44352 chrony_4.1-1ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmCkxOAACgkQuj4pM4KA
skI6NQ//dga4YB0m6h6flJ0lBveKkvVAwAUtx2t/cslQR5s3XTOpOfO4RGi3/twZ
pkUrUYKFTbJ/qHxUJLkAUxTo5HJ5NFWM5wYULeEn5Af4S53OtA0RK3A/U4HXZ8Y9
y7Ag64TSv773szM9+CuSZ7Ct/NSyei+yvqLRQAXEQ7/AJWhoESRF/xmrVdh9pYPX
p8wlm0JDt6W0l20GSFZlqAJyLwRoI72srSkyxDdrhyzWXP3zBCpotddFrWYEFCmC
7lSXhrRez5ccK9iwf3kZUAZXCc7UA9myXmyx4iWG/hP2Uc2B/8QZaXgAuvOiCcLJ
2VqZp4IGkty4mGwstS0p4xqaQ2QGrwqwPaKg3wu828AckULR9UeAB+ug2rho0KoE
qMJ7G/Xb1OMqbAWJILCN4bfYvGJArxRTOKQrH1d49sR53eXCA+jJe3WANIm6nml8
c63ceHivJGxenSFmCrrrN0D5MhpHa+iHms4DWqpePOuJeILhafoTxJ5OkM4fIKd+
RuI/sWk7DEuea0GYNmSHHPDHNa6CKSmMCwCMgcYmJizVxnKRwW9qkhAbTGZ34oz5
SB4ZiNAPIRyZqh5Qh/hcg2yRwJFzl4qiMX2s4dqvkzusnTM4tdR6wy60pfvbYUL4
9hr9FJ/xoxpYw7J3x3ClO3hCwyBVFmke3Mxs6UGKC1PRyyTEPbQ=
=VdvO
-----END PGP SIGNATURE-----
