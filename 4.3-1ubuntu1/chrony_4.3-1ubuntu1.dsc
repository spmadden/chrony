-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 8ff74552546351201c1ae612100764f433a8eda2 45920 chrony_4.3-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 4f2945c75ff7950c52d96a857f7d8368fdc47bfe4d887f586feab43fcf2f4a15 45920 chrony_4.3-1ubuntu1.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 b2a8a3ae1e61717f100242d562bc4ea2 45920 chrony_4.3-1ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpmEQCz2sHU8srYpU5gOyV4+48PsFAmPAqtMACgkQ5gOyV4+4
8PsSsA//YnCNqyftKXW3bqipYOikAXnbRKtsfRLALs/PobkT0Jf82usE/lALIy7E
1/AcL9d9sgzxNpJxGAQ30ppoiKQFMlaMFbpNcO+F8cvyS1z3lQ2e+E7C3CGwAgul
R4pfvGB7pxXoMZPLgWIx6mQ9lRaDrP7pkUg2teYgcBAycCExuiJggDRzRrcIJ0HY
+5JSOG6xrRCFtvChxCZzovU8BDVWDPJndPKy82RapbLF2eo6/Ds6+sohoKmGQzz0
U5JNSIwRwjkhJKnoPo49JnvbpU4muXsoASCLoM/4KPAdLSKKXHjB3E39lgvc9Z5q
nmBs1UC3Hw91aCsZ78le+HznwkUMh0WBor4jI3Nr2U7pUhMpv3ewsmqYET66Oxzc
V8Y3S8XThpHVeK/G3RQi8av1WwYjfN6zYlLaHt2MKnmWPmg7D6OML+ohuc6KqUkK
/ll4jWMemDBsa26NdTqcUsq37QFHg6o0SSRX2m7zjWPAmN2J9ZI0otTnt9V0CnWA
y88xuvhA7K/UY7G/tgMkZUU01bOuRwI89Q1jsgdxaFl/kiq6rkF4Qjerfm5bLXby
fpJDpQysi4k6wnlMK40gIX5tgQkfkIC7ssUFiSvIUVceYXx+QnJUnUY/yBylxSOX
dLKGnoWKzei2N/XKU5IimIEgHc3uBjKs9rS005r/4rkBkLBhOS8=
=clCs
-----END PGP SIGNATURE-----
