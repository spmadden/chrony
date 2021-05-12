-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 b899d54e9b7176f1b500c1cc518501ed8e2f83da 563277 chrony_4.1~pre1.orig.tar.gz
 96a8331e4cbe6d915857cea60d7cc9a7f43cbd39 37816 chrony_4.1~pre1-1.debian.tar.xz
Checksums-Sha256:
 e9fae6f20f92e01cdb9f012662eeab7d663058509f2777b5db5daafe0355b512 563277 chrony_4.1~pre1.orig.tar.gz
 f76a814cb3feaebb317a73286ea80d9441281d61568ff07a5cd5a65fb24fe099 37816 chrony_4.1~pre1-1.debian.tar.xz
Files:
 af49d44cd6e1e23ad1249fddbd8ff004 563277 chrony_4.1~pre1.orig.tar.gz
 47044f0ad3f3fb473ae240caa2a446f0 37816 chrony_4.1~pre1-1.debian.tar.xz
Dgit: 08e0d5111c3a242c82286cbe0eb38b0d0da92c00 debian archive/debian/4.1_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmCcK2MACgkQnFyZ6wW9
dQq4Vwf9FW536fi9FLFNLMdpqaCoTuCcfAOCIEg8HjPs1I30gSXbnzFKsFP+9t9Y
hH+J4hvm3PIYojotFtyLH79HSN4XCLd/l+Qfa3+ftHCp/0N1XbrRw8AJS++LiRcg
TxGoeOdv57Y7IScyqYKxR4El4Q1NkX+582uy4MYxSenf3UqNwOsid92nDrRx2lb4
afrWVk1f7CNjU8X7GQHgCoqgbL702AnQfOTbrxmmQ7UXDpEdIlZPTv0lqpslk5Kw
PDgylXCWa5h3KWewyNg3dQnWB/Pg/GXCOqBR0x2fSznHFJTIXU4P+ESLxwuVgS/Y
n7PUy7BAig0GRWNJZh03cInL9Yg+Og==
=KGwJ
-----END PGP SIGNATURE-----
