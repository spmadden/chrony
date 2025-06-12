-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.7-1
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
 7a59427bb96df4b1d443cf6eb5bea9e95a6b071f 644610 chrony_4.7.orig.tar.gz
 3c19de582bfc9cf216ac359477cc58c8febaae7a 833 chrony_4.7.orig.tar.gz.asc
 e455e6ef17d01ce8a1ee16445f3009a79b2f62c0 42436 chrony_4.7-1.debian.tar.xz
Checksums-Sha256:
 c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b 644610 chrony_4.7.orig.tar.gz
 ac3ca0847891d91551d53ba6adad257e0261bc6fc4f72175173bef3c6855411c 833 chrony_4.7.orig.tar.gz.asc
 9c38f03e0c05d21ce017cbd952a7c1d4e35eb1af461e75397b78b5a1130f1cdc 42436 chrony_4.7-1.debian.tar.xz
Files:
 a1ab6e972527a9cbf6bf862679352ed3 644610 chrony_4.7.orig.tar.gz
 c4fc703ea91ef6fe12fc892b29950821 833 chrony_4.7.orig.tar.gz.asc
 59d4246bd0d03a6cdabbbc838d261272 42436 chrony_4.7-1.debian.tar.xz
Dgit: 5268e8a07ab0c94a3df35a2173068536733e8891 debian archive/debian/4.7-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmhKd2YACgkQnFyZ6wW9
dQqTYwf8D3OA0i7YaHhvl1q6soAzNhORX/94gRoyZquN3QryMf51kzxWecd7JxVr
JzQIw5K+DJAevD969WGOaN4wbRcCmG7/gJ/1uvXP5AZ4k8+zhv4IHlr66EGsNdbG
eJQrED4EVgRVmOXJoZkeYVRN+7/XQDQyy7LcnzJDaIG2j/R0SHB0DnhXubef1Sji
butKHryOqgpWxpx4PRL5cRa991vnih8S18iVfM1t330HV7V3pQtUysyH5dvtyQeL
xqW0Lx2QRcCiRybZVzhByi8aIOJwmc63TPWC7RG+l5l8p+UaLJQQ5k1xJOXWo+ou
TG3g2NPMNhs5GaWHW6dNSDbFJGLx4g==
=IS19
-----END PGP SIGNATURE-----
