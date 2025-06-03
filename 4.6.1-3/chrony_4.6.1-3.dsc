-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6.1-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 35b070fdd446080232844ac9f70f84ca1823206f 636076 chrony_4.6.1.orig.tar.gz
 b17872c45275cf0645da1ee5d4371a4c4dcc132a 833 chrony_4.6.1.orig.tar.gz.asc
 52379df891b3d0d1e4dad1ed7bc94b5e2517593a 42952 chrony_4.6.1-3.debian.tar.xz
Checksums-Sha256:
 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c 636076 chrony_4.6.1.orig.tar.gz
 df077dae0b84a2a81076f4dfe5f05482d13ffa9100d5e26a494bd1f94151671d 833 chrony_4.6.1.orig.tar.gz.asc
 fe7962244fd382bf598602bf6afd848f1ce0ebb47e4a40a23f6ec05d8bf18ce8 42952 chrony_4.6.1-3.debian.tar.xz
Files:
 81a83f54d5f8e1d5fd9afcf8a40c493d 636076 chrony_4.6.1.orig.tar.gz
 062a129a67d81a58b2809e35e917e1b9 833 chrony_4.6.1.orig.tar.gz.asc
 4f3c5ca5ed3797aca1c13dd0a02c86c0 42952 chrony_4.6.1-3.debian.tar.xz
Dgit: bdf6f35e4ca785a3d19600fc414476a45835ef4b debian archive/debian/4.6.1-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmg/HRUACgkQnFyZ6wW9
dQp/IQf/bRWiaa6oGVL0HlYF2CjFixFNrUiSipCgap0/zYb77GqbsZHp95W4XI+n
f0TeTshuV/dFjUIjs4h/yA3Ox9Riuoj/VsfXNw8hWN9K+lXIm/vV18XkwRgNGCZY
7oDgJLp4+b4dFcFRKTg/Z7bPJTDJyn0AfQ557VbNxViNgA/T3Qx+hqB3CqT1va7a
C2qwSVMWceG0OmzCmguDFwFId8D6sbdxL41WU2A132N7sDONrYovhHa2R5tWzNZv
g4LDF7h/X/obtgsQziazZAE+eY0o4Qh+tnkNoBNHQpwNz3lwRaecrkCVvPlmAkPy
QBEN8kzeEb48/G6Y4lH4+NFfRp2wxA==
=MkZK
-----END PGP SIGNATURE-----
