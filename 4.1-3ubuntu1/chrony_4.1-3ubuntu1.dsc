-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-3ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 15dc1976653f17d290b65007a4779e3f4ac1833e 564648 chrony_4.1.orig.tar.gz
 2b23680d18f4c9d9447b6b80bf4992f35c18495d 45772 chrony_4.1-3ubuntu1.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 e6b528b5a6497b43f4939d1ec92b4f3ed994bdf278da1a994b375b30a1d4290e 45772 chrony_4.1-3ubuntu1.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 cacc36616efade95a0308ea5ffb55c0f 45772 chrony_4.1-3ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmEbz4cACgkQuj4pM4KA
skKyqA//XUGv1IZXMP79ORzed96gRUYpV8EfoKafgA0FMCyavSWCYmrS76pjLZwS
oL/7fS1gbXgBBTMochkoimg3BeMHKH4NsR2/rJvWJFI0IL5yGCZHwfQFhaAgVWNw
B4eRoJPDQGZH9SY3bnitXBvxBWl9mrJgTIvfdgyy6Nk+e5DYILLWU5MVb+hTIxE3
qNZhyr8+3JG7pB67qUJhnx5RLpTypt6GCs5796VOqfpNF8WPJQs6LitNzEgadenM
EpSpW+ECfNXRst45PDIX8bEzd8+4Ca/y3Bjbs1abEVDf1sLHjfBxVq50UbXNKxD7
/q7cQ2yCjgBCAcjsBNc1vYg+IoQVspSeKNG1ry4XATo0DMeJPiKylP6EBkv4B/rR
tDhqK6DJU/ya5nFbdDxQ86nqxkdaqFa3FAb3skGf2Mka1Nn79wnoltEsV7RJ/x4j
CSD2p/FQknWqx1n/FoVx41fF4Fuln3j9B/Zs8K+xaxElPGCTbDYqYU4IaYPhrot5
Xd5auFrnHGQ/yX+3OMmY6l9FFmSj2BrAy69qlT1MSbF57HHZDO35NpC6SenGcOt1
sFdvEqP0ogAr7xt9Upo28lh6kv42DNpm6DUZENhzU9r6hBvcojvOWvxZkItjRKFK
kZBluDD/8mkD+y7Oka7UEIhH/85Q6v27CcJ1WDenEZplneuiK58=
=Tae2
-----END PGP SIGNATURE-----
