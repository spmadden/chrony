-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5.1-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 3decde1c1d56e87d89b34cba662266a945453b3a 459902 chrony_3.5.1.orig.tar.gz
 83f82d1f4696113b819646d3c73166faab5c4479 37072 chrony_3.5.1-2.debian.tar.xz
Checksums-Sha256:
 1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7 459902 chrony_3.5.1.orig.tar.gz
 017e4f80a87ffd708a0c2d780428a8c4785b8035221420114516f48cd6f1a80b 37072 chrony_3.5.1-2.debian.tar.xz
Files:
 1dfc70ae8fd18f0456101b7a91b30234 459902 chrony_3.5.1.orig.tar.gz
 d48509ddf5326588321e5c9e7651aa4e 37072 chrony_3.5.1-2.debian.tar.xz
Dgit: 3d2de2a5522a9c8078eddf58ef3da477f2fdefff debian archive/debian/3.5.1-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl9iWH4ACgkQnFyZ6wW9
dQqLCAgAogzeo48tKep5s1J6vAhYkLodXdSrS1HG3yukrZvNjeoa9c2F4k/BCEsn
RWuo63LB4KYCH6bUWjeHz0AVvTIfQiA0K6AIxC7jSh+6VBpZBhYuB+oi1xbQbrx3
AsYyRdMCzEqTMD0P2Gd/Yp8Pb+UGheKO/H8sKfAVgUh4YbiH05y3MKK3jVhjNQYp
fDiAReUzrN15JaTDLysuGgP9fPNxfk3uVO4w+/4RGr04E0H0BTltwZxrovUCiumQ
dc4TA3hdAT0Ib6yTnneBxyUcurlwtK6gQuD6uRw+DTzIDa2ReGxfZure+i6qRkg9
6nPacXqTEsbYT4iezA/y+U+jZqtmiQ==
=niBW
-----END PGP SIGNATURE-----
