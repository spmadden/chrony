-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu4.2
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
 02331ca36329400b924789c5ed70e92549dd0e29 47452 chrony_4.5-1ubuntu4.2.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 ad09d3f40cfb28ce22cbc0e266d0a4818d8e4f98ee24634a8cc851065f37a29b 47452 chrony_4.5-1ubuntu4.2.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 a122ae2cccb13aebad8ca12521a20da2 47452 chrony_4.5-1ubuntu4.2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVovyKmYzfL/Jprm3LIPbyOm9DjcFAmb+IZQACgkQLIPbyOm9
Djdt6g//RUmvh0DFe6gSLROjUMCsAVIXb+/9tShpDiHgfxCeVC38yx91NPXs4h8G
/64Y9y5ZySi+82ONYe2kQTBrGGe87S7uUxKlXwLbaCOYssFyTa99aVNYDyYyAPHC
fpuCzp1COLnJUSLYUDPX8CX7KuY/ayGQTIseT/H0CqR3y2lt6rxKm0xlGd5BjF7h
XeTWfjCcKmikHFaKW7/MvbQaHKeKSa50Tv/Vv22i+sUFkuOW3c29ul94lKx6c9+f
pXv6WXwlJn/S5/Weu8BWjRrsMDtDgSANUMVKpanOU599uPjjex7/utQy8oY4mr28
QSkFvec/rFaoqzCgWaFDwtw2sdIrXl+FM8HlIdOnhO2z/3QQE+/SW3F8Cg9Bev1K
gZrgzqF5ZS+xhINe+Ng2ZZoz7S55UsCBwaYeMHJzE3XAqs/cJhPQmDWZ3WA/Cec2
jJtT/Q0/F95jaTdOqWRNWH/YbGXlQiHJSc0z5i6vEq/pKggGCkJO65ZavWRbV4Mn
nxkksXxa686sllYjeTYgkBgnQo63vtmkCSJSq9MkzaeZYkkFqsybNJlXgqhUKJeS
3PjsX1vTyZ7lAnmhvvrJbH5jwqEMD1SMsKOSeNGOoefRUjR08DGP9vt/hzVv9maj
iY3jLZmUExe7eP0WQtZBoqg1Gf68S1b1ZVfJMPymuBs7cJ5QZ+w=
=i9B1
-----END PGP SIGNATURE-----
