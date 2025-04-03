-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6.1-2
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
 1e88e83dc0db10969fd28b156d995272818ae8c0 42020 chrony_4.6.1-2.debian.tar.xz
Checksums-Sha256:
 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c 636076 chrony_4.6.1.orig.tar.gz
 df077dae0b84a2a81076f4dfe5f05482d13ffa9100d5e26a494bd1f94151671d 833 chrony_4.6.1.orig.tar.gz.asc
 233e1e0cde62bad5fcc937858763499113b9c1ef9404b572a0ad6e1828600be6 42020 chrony_4.6.1-2.debian.tar.xz
Files:
 81a83f54d5f8e1d5fd9afcf8a40c493d 636076 chrony_4.6.1.orig.tar.gz
 062a129a67d81a58b2809e35e917e1b9 833 chrony_4.6.1.orig.tar.gz.asc
 c6059a4696b427625c2654f51ddc321e 42020 chrony_4.6.1-2.debian.tar.xz
Dgit: 016b6439add8fc0e1e1ee4d02840166e1dcdf9b3 debian archive/debian/4.6.1-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmfuKPwACgkQnFyZ6wW9
dQpLTAf/SmnudM/jaLcZ53eE1R+TgUsp6ZB3BVqaNsS/izOU/SfR45OUIRAkJgT3
zYGMXgdLs3Kdu1mcEjqesUku3QEh/BOW/Ecrr+rvYuNecu43C/XPBPiuFsTbw9Me
jZiYKhTYY8ROykYNoMOErDDEI9zHC1/2LO47aZZsu+wpb6+HASi2bpzLtcc0vKqh
zfWVKZKpGnxb5XZDeONyhKNurQR0+BtlTqJYq+2dz9B0ErEA+XF8oi3fnSCG0SUf
C/0F0UyAJe01xV0CZjC2bzPHSosW96HZwG4eA4F2d0ckOhQSYXykuJKbySPTVTJy
3sZQ+evqsoZHST2AVF20Y3HY8jh2vA==
=TbSK
-----END PGP SIGNATURE-----
