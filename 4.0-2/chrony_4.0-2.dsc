-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 1958c473d06ff9f7f56047853e865bd43005748f 34844 chrony_4.0-2.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 c2b0be70ebeec812e6c4bb0f469939dd1e58740725ca37b6c164fc6ac6661774 34844 chrony_4.0-2.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 bd60e69636c3d22a19e62af657a9e376 34844 chrony_4.0-2.debian.tar.xz
Dgit: 82383d19066ef9ac16c79a4c5171642236985ff9 debian archive/debian/4.0-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl+F7+kACgkQnFyZ6wW9
dQp2bAgAgkWiYtr5Zv4daMqL2TdPZTgO4sUvNjNIxsHPOfv6HzeD+8q1oKL7r5+L
PdM8c1e8bh00sym2x0DxGsqn2Ks9MEXqz7u1IKPB9jfgKnyGTn0+3nB/Nj15RgwJ
RL3kqXkdoza21RaezP7fPCbhMr9Rpn/IeQizsAfHXravUPyAYoJOVmHgp8xfnTYL
00FWWvJHcNG59UA2tLnI46evrqHcPWEuhMoJVa0HxcgR4RczytJJSjNjC4bFRnsy
Y0OjtKha6jiPDMouRa4YW8mOEmT9kV6B50EWt16gWB3hH52pozn/YlXcK/AVOoOL
phrQCjDm/x/yRJ7gNnQbttSyHHXodA==
=jta7
-----END PGP SIGNATURE-----
