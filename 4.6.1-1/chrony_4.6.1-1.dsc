-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6.1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 35b070fdd446080232844ac9f70f84ca1823206f 636076 chrony_4.6.1.orig.tar.gz
 b17872c45275cf0645da1ee5d4371a4c4dcc132a 833 chrony_4.6.1.orig.tar.gz.asc
 2403d3661a744e563a5327a63472f9c19a416889 41616 chrony_4.6.1-1.debian.tar.xz
Checksums-Sha256:
 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c 636076 chrony_4.6.1.orig.tar.gz
 df077dae0b84a2a81076f4dfe5f05482d13ffa9100d5e26a494bd1f94151671d 833 chrony_4.6.1.orig.tar.gz.asc
 9e1087968a2beadb9de9a0a27d9666e4b5373f93ba980f2d2339e73bc45b3373 41616 chrony_4.6.1-1.debian.tar.xz
Files:
 81a83f54d5f8e1d5fd9afcf8a40c493d 636076 chrony_4.6.1.orig.tar.gz
 062a129a67d81a58b2809e35e917e1b9 833 chrony_4.6.1.orig.tar.gz.asc
 a72784d005d8d0484cb5887b8974d9bb 41616 chrony_4.6.1-1.debian.tar.xz
Dgit: 7e73e7ad0a94850263776fc94c4d93cfc2090bea debian archive/debian/4.6.1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmcFjLIACgkQnFyZ6wW9
dQoWbggAo0yfbGF4iSD6ONu91D5ilSvSJc8Z0XM5pyDIPNZ+9B7kMSXzqhU/YLUs
RsWILe0qd28iOaeIlV54LMZGHlsrJa1AE3U5L82CD4Cs8SfquJs62tJA5E7nADkc
p0Jz+TpHFtMG6EFhsyO4KveJO/9IV/Y4jkYvKbaAD+Pg6/mf6j6AIFVpUzUNcZRT
DNw6J0lEDbWh60/q5aYB9Sb3Eo/Uqq5yrbTM1S22k2SAemHErkRNbOigOFK+A0TL
IwrfBU6UsP993QLelcJZf7gG9Qxy+/By204x+QDhRTHqOPdbGcTi1XlsydNdEa9i
36vbXOulUqXiECsIDfeAMFmAqujU9A==
=vJwi
-----END PGP SIGNATURE-----
