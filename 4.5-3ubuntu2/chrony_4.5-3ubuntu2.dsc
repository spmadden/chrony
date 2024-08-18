-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-3ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 eda27e1bcbba3b8cfde63c4766506b46e60d6f88 48752 chrony_4.5-3ubuntu2.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 1084e149d151a4e4a733d2402496987081b2db161123ef63e8b199038298981b 48752 chrony_4.5-3ubuntu2.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 de062f8fa16e4f178b6f477d2c13c264 48752 chrony_4.5-3ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAma999AACgkQAaxLQINZ
Cph1QxAAn1flbhgL6VQlixF8J3sheZB+xb6JT30lLFm97XBfalkMP1Uhq2LGSMHb
UxUSbw/v4HhIjK8eAf3ZVHQTLbN5hvNjimzjhbafaYCz12vNCC6yzVXf/b/4QTTU
4qsRai5Kt2o1rRjDDbayeEDHoQnWLPmZ3PEWjWo4quJDZWDlR8kBWKC2Bl4gLqag
6fO+Wri5ffy7YYI7fq7M+S6pVE129iP0VhN7kMHj74Yx61hOV3j0RFvpF2gnHcf+
I5MZCEUMwIAkDo2d5qrJWVXgmiqDR6ytyGrVxEffFmxpUBcj7Q3CaDcH7aoJBZys
axPnH+E8YSEZq2aevNtpqFYA6WeJORBfkivmkAdcVdKQuQKuOAsv7TxGeo70wh74
tHyRmeg84WSfd8SCmfoFccGur8lEoV+lcIV+i1m7mknMTXi7jPaGZRpFuXLj7vSY
X/6/TVKqlsvMQuuR2R/U+UKN6kIaThgoDJ8b3IVinrbC0+07mCk96f45uNorAwYb
3iZ8QB/U1xXbULdekw0+Vci52h19lpeHDAy2zUPhtIBxssVZ44xj6SwFktpclAxa
+t617uLzbGyA5ATvTPbrs5YFzBqJH158P0RiZjLH6mc5NTtRzHlbmTHip4IyMkR8
tBnoF4sWlfVqWpyAxdkT91j2oh4RnqIhQDDOi2lF1Rws5mk+uSE=
=JyTw
-----END PGP SIGNATURE-----
