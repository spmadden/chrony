-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 00b7f5f18f788907c217dd88b738448b06d4ed70 47100 chrony_4.5-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 a29f0e3b106d7e59cc2bca13498b780b4b0729a7a6eafc20964296d6c41a03f9 47100 chrony_4.5-1ubuntu1.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 df66d327bea3018e63a9cdad6dc28fc6 47100 chrony_4.5-1ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpmEQCz2sHU8srYpU5gOyV4+48PsFAmWyhO4ACgkQ5gOyV4+4
8PsFKg//dpAKQpV9wQ1Rx/d+I84WYJ8AeVeMUgtsxq5r08RXqDzYgdXG3OcAqQ+n
qYSwHPJ1PA/G9JfR8jk7eKH+x6LYxKubdAuAnBtnBp6CDHFkR70uHr2/wq3oU5lR
Tz35oulZhwj6P/GfDZ3xbYNyYUi/m4+a2vbKIV9sc2pQylQqZMrUBRUVFhWNLKB9
FVPWt5cpr5HkA+RI6KObiAmEIFMlF1GxPUpGCF6y5qEncgn6cpU4KN2gFzhNjw4r
M0LbIEvzMXftJtD8BO5lHcBnAn8wiipBMqpPHN+eCTNZHjJlYIWqfD056PuMEsEf
+YWBiVJbXcdAkfRItCUTQQB9BoRk2RCQcAxU+e66JtRR5fYtWHv9D9JRw2pdP96V
lhkU8L32q73XY83p8XaPRstzIgEom3ChYglZurW0dBvFTd7J/uLw5XO1Vqc2Q4N/
vsqMnlonHMEg6sTnJibx5xRm9nuVFC8Qf+8Q6dn7bZ9HKznpiM0Xp158cJi4Y0u2
T2gzO24Q6JjOb0Pc5Sqv3I7SXGmf41KiGgAcNcj9wtaOfqr8HqCpmk5rbt6S3Vba
wFsk/y3E4UPI8dYqMX28wtu7iqdpKI/GNGRFbOhkWl+Xk0t3F+8oEWv1ONK6Fse+
4QjYwblaxw+pfgfbuvZgEejacKXAv9h8oW69tcWx9CcHZaTPLOY=
=Kyqq
-----END PGP SIGNATURE-----
