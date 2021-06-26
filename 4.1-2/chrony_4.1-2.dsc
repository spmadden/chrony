-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 5871317482e051cbc58574115d2f882a6da3b0f5 833 chrony_4.1.orig.tar.gz.asc
 f9792e54c6610170d6e1b257b6fbf378d6a4087e 39224 chrony_4.1-2.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 d1768fd1a571fc0e37a4e6f04cb1cdace1a38610e000785b577c2104b9bb39f3 833 chrony_4.1.orig.tar.gz.asc
 26c73d5e5d748ae7ddcaae02ae1b26e03a793d8b777d936eeb63dcf6d3ab42f9 39224 chrony_4.1-2.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 0429633f2aa1dc1a6dc5d937c411b8db 833 chrony_4.1.orig.tar.gz.asc
 720f2f76ebd3078fa5937ee9dc7d22e2 39224 chrony_4.1-2.debian.tar.xz
Dgit: 40a5d13f328c4b188ca0bd0c26ef21157ff65f12 debian archive/debian/4.1-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmDXXnQACgkQnFyZ6wW9
dQroJggAnFitnaLqqbg+me16eXvgoS5b0l8HFOvfpa8xPZeeAVw7Nw8GW12FyxpF
3ULSm6dV6YtPfF6oy97uBBoO3UhaN6N8hm8b6mbmA5LapFsIwwCcRpOz2LXqn8xN
XUYGvyDTIEcYCc1/tlsWJ5N0teh+kyVznruAGEhVocCOBSIdlY6enWI5gwKJq9M8
Ew+qKf8aFcSK35WrjadHo8AozX2E/c2EczVrd5KHMJ89NYqfEkOAZujTdwiw5N4K
2yR9WyNW06E0EawtbVhIFTU0tXfPuDHnKy5L6LLD2gn2ASv2elfIMRL1zwcY3nHY
zeaIFdptILeH8eYKpwUeP4oFdt0llw==
=EeG4
-----END PGP SIGNATURE-----
