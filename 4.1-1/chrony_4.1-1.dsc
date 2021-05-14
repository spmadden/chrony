-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-1
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
 15dc1976653f17d290b65007a4779e3f4ac1833e 564648 chrony_4.1.orig.tar.gz
 5871317482e051cbc58574115d2f882a6da3b0f5 833 chrony_4.1.orig.tar.gz.asc
 43e384d6e7dee819723734a8e9d69aa9d5b990fe 39052 chrony_4.1-1.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 d1768fd1a571fc0e37a4e6f04cb1cdace1a38610e000785b577c2104b9bb39f3 833 chrony_4.1.orig.tar.gz.asc
 419560b26a327755099960d7bc455eafa69dd70ebf475e769a6873b3dcf85611 39052 chrony_4.1-1.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 0429633f2aa1dc1a6dc5d937c411b8db 833 chrony_4.1.orig.tar.gz.asc
 f73eaf555ac874863f23de420105c80b 39052 chrony_4.1-1.debian.tar.xz
Dgit: 54d4b4f722416ef82f4229cc2d1bf04b8c6bb08e debian archive/debian/4.1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmCedL0ACgkQnFyZ6wW9
dQpSpQf+KymlqBmLJwLfY+tRJc+QogTBRldZnZM5cG+IgudtGbq841oQXGzkT8CY
ChZ2VDH2kCpG0DHkeHI8WC9UJCmN73lwQ47Tp/YZaIEfCH0Ba/mQK3ODFgx7ivmr
xxV0Gb1nmYBMhy49JicVcR9PTELmkpBlj7BabeRDll2frsZs8Rr8l/yCjNfTg6pg
ASZgANd/r0fJNijNqlBW9lIDhWnMed5XS3Xuvdh4o1fzHo8pkURPOjhDi06oTAge
9z8+tpOQPmHE9UDkM61i/XdIiGxdE6FBoTQGH1/Mstz/rjAENZmbNRpduDhcVZ2s
pp5ZOhOdkfS9TZOBBlc/ZcZ++7ZnAg==
=5H/B
-----END PGP SIGNATURE-----
