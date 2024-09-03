-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6-1
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
 303aa60b2f5b473ec4b87edcd4e9411ce69059a3 631899 chrony_4.6.orig.tar.gz
 06514a96bd3d041b637d75ea7ab3536efbca1f00 833 chrony_4.6.orig.tar.gz.asc
 dcb3515941fd6823ee65ff71c7705d959da57130 41604 chrony_4.6-1.debian.tar.xz
Checksums-Sha256:
 9adad4a5014420fc52b695896556fdfb49709dc7cd72d7f688d9eb85d5a274d5 631899 chrony_4.6.orig.tar.gz
 cbb4ca01e07d12aa5de4a734bbc616c2f09888c6bde3c0c6d7649a258895cea0 833 chrony_4.6.orig.tar.gz.asc
 080aa7f625806a179afc668b09d4e48362638f558387f6101f863ba6938e0d92 41604 chrony_4.6-1.debian.tar.xz
Files:
 847eb50fd67a85a9b16c4cf2cd584a29 631899 chrony_4.6.orig.tar.gz
 740e50ab33b4b39cc7f0a6bf6e712f87 833 chrony_4.6.orig.tar.gz.asc
 9df27364ee5818cdb14617d9f1924af3 41604 chrony_4.6-1.debian.tar.xz
Dgit: a859e4ff4192e11dd9d41967b038773184f4cd76 debian archive/debian/4.6-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmbWGfMACgkQnFyZ6wW9
dQqBJAf+PqGzl6/exrEy2nHm/g305mRzEDlaFNUXpsdxRZilAMkrGvV4A3AMK95s
iDC1jScUiFq/oSadJgNwwgt9Z5VueyMJ3QT5lrzPsJUp6JV2Ft7SwcnkXVODqrJP
NVC7pgRdVt/UqY3KQpsgFNZgHSJXY061eTvgPLWJ4xNpQDsYrOMhCe9jAm1TpJL9
NAfMiQfuMPF6XTvliKy7b9SAMOeSXWzo4OQZXS+YJ67GoYRv9EORzlnH2pH4sTHD
lqZXnnScDTcyHq1QShIUvnkWKhcXtpfw22KIfe5wYG0+oPdR5WqdZyMR9G0eiosn
egrJUirOtneGos35MZ/nk/3y13R59w==
=2ZrZ
-----END PGP SIGNATURE-----
