-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 0f5de043b395311a58bcf4be9800f7118afd5f59 578411 chrony_4.2.orig.tar.gz
 9934ca9021c369c174b4eeeecf162a9d2078c4f0 833 chrony_4.2.orig.tar.gz.asc
 fbd0829ed647f6945b582e306bb847a097041125 40260 chrony_4.2-1.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 ea6eba0197ad9f1dbdcb283662cdb3be3997a2c8fdba93ee95b9c4b09570e73c 833 chrony_4.2.orig.tar.gz.asc
 3aae95a0b32adb1c569379ccaae9f00a741ae7269440d378a02ddf364577e495 40260 chrony_4.2-1.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 af3e056ab8999a52246f684c929701a9 833 chrony_4.2.orig.tar.gz.asc
 e2535ab4c62b67321a98d5f6083d33b3 40260 chrony_4.2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmHh06QACgkQnFyZ6wW9
dQp78Af/f3HW0vl2HcJGSSoi0m8V6e/8TajmPIQQI+7e0hmOkZQGGrdKObGZr/ld
QC2p0GlPgR1l80X1fsgN6xCPZGwKsHShQGtTqdbKQwL7fUirZdkqt9yyR/+LR7Pp
7nBOVvmkmcD5AGu8Q1S3m8m5wJeAQCP0MyO2aB3wr8MDgYiUnemX9EdiCXen5w4W
eZFugF4xpm4dpmO5ZrJ3nI+vvXi9fjplhuO7/lkMsyfsIWwo6oEit+l3aFhK18aG
tAykxTA502bD/jZJ3Z1oQtwI1Vg1WAre7YIE2hCz7czBjHKwjqC4HUpD/sEx68rL
jayxMYEOBtN+AmzLXRUX1xhiAmG/xg==
=OfOR
-----END PGP SIGNATURE-----
