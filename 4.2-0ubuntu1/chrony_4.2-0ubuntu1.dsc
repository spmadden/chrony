-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-0ubuntu1
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
 188ceaea3a061f0dcf71557f3aff71ad00667562 44888 chrony_4.2-0ubuntu1.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 3cbf9a80726f3365ff286965eb634e0b179f40dffe3f6163c3cd2592a92772e5 44888 chrony_4.2-0ubuntu1.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 940dab046ef0092e3d77775c4c6169ff 44888 chrony_4.2-0ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmHb2pcACgkQuj4pM4KA
skLSTA//bC9zAeCCfeqGfbJJ4z9ZgxRL3lkZhSCIF+ZOcTlnX5SiT3jTlP81QBfe
uZUeGQvqhcGauwzZ0TdciREq+sMKx0SNc8+6LNBLyNQe+4dWaHZZmV/gM4q8EzxR
sFYaxm5kBSpJeGSsFhpi3djUiHhcogbN/TdPLaWqVTTjRiQEwkzLoKPiNJcIA/TU
myKf3FDihLIiA0NU0IlWxck89KZTA+wUw5TWwBN0Yx3gPWT8VnKPniRcZwfe2vk3
QGoins5FiW457CDWuSa/CJcoOuI+S3I4c8ocXuuZgD7B30dxfKboNnFcpJzXRAgb
XlJPQxzKinh9OdVgA0mn/SEDlWEE1jr3Elrffon5Ai4PpIyJ04iUeD9SoEeYIPS/
cadZc0g1ipZefq2Z2ane/NO2XzLbraXQ7RiwNm2qW6MJ0EUs6n+jFhqoUr/XTHfc
AKQ647vcYnVOYB7q1zXyUVakwkTHKUVEODez0FCgb+QPBbZ9Di5LeTVrwKwhrnD5
igLajXgSzkyXwRtZjiBcuPvinMLtUc7Ff03KjHEvT8cYKVBwKPtEIr/wfOlnDUs+
1lG31OTqWwHi5HDCLuTZyCARVO1SN5553sVpQqoAD641CxFGb4x+pTNQvqkMk7eM
RCocC+lAiMRTxwpFtMIxwWN30LKi4Qf+6048J0eCxeaFYDnqaWU=
=8s1R
-----END PGP SIGNATURE-----
