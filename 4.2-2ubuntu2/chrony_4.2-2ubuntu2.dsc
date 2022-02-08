-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-2ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 d9a5481df626702b596dc1fe25bd3ad464ca4809 46092 chrony_4.2-2ubuntu2.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 e9969455c7378a4e544a16d85540f01c7bc57edd17af0df091b3cdf5d92c49ad 46092 chrony_4.2-2ubuntu2.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 30fd6041db82daf4790ed66ffe534a93 46092 chrony_4.2-2ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiiBE+E9xaoW3f/djEd9ClMyjmJMFAmIB6aEACgkQEd9ClMyj
mJNnBQ//e02tLU8DV8vvnQPOtRPMv30eqXYfPpZV+Q8tv3vkb5Fqczqm5hu1HL9+
XQ/NKvix8WPOj13qD3m/hHQSG2vaaqzkufecw43jDSAF1jHILX8ai1tCyUXz6INW
5fonQ2agM8nB/IO/fO82jGX70QLIj3zGBhcy3iqeWMiT1DxJuxLyYdz7CehUlqlG
oBa8ofbF6qSlmOCZmfbb+RQ9cfXD+GUHdAQAZQN8xou8Tc8o2af54d7kqGyHvM2D
nKIany36OlC3n0cVNxhvc4VaRIT3KLpQnUkR8q67CR/RNzPoIryuVR8h7OQCeAYz
nwleBty5SC+QydO92vKduGrVP+dhi0hPncBGGiUuseAPD37S5Mfs/ENl4UUaYMWh
7qp7wCoYhIdTrPw8WKemyiWliKX3lPHzvVyPGpBSwDzhYBaSJBPX0MZgycN5ppZz
hv5GyNG+Cp4X+CqSt5hFrJYkxKAmrxYiSq2Tnyq/Iczcvn0VlWW4TQtmD+N4HoYD
lY7PwHnMbVU8XWh7NN0Xe8hxarjL5aluhYtOjcc24Ftyyw8z/9Ecui/C3g+1xoeI
8p2iZ3QGTnc8I9DUJw4BWfZs2GeV2m8in3uZxxRE6LygLZQMTDV35xGfNdTnKjpg
X8zjX/HspYwd2k5vzdT7CsbDahVW0zU6dJ7fz4CFrX1RCIRsmJ8=
=Z7l+
-----END PGP SIGNATURE-----
