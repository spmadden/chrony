-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-3
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
 92ca41f40b07c96130f21768481252af6f394129 39608 chrony_4.1-3.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 d1768fd1a571fc0e37a4e6f04cb1cdace1a38610e000785b577c2104b9bb39f3 833 chrony_4.1.orig.tar.gz.asc
 9c5d609676f45bf42a02a906a6e78a8ecedeca227be9028f54086409b85ebddf 39608 chrony_4.1-3.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 0429633f2aa1dc1a6dc5d937c411b8db 833 chrony_4.1.orig.tar.gz.asc
 a771650d94b1c4be37cc0c5f4fde77de 39608 chrony_4.1-3.debian.tar.xz
Dgit: 066f77d441bdfd79308b7cf5c6a89b04e2846cda debian archive/debian/4.1-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmEZWpcACgkQnFyZ6wW9
dQp0MAgAsvMRKbWotchh14vdJhpMOV6OLUWzpCqrTSrtb09JfHt/lwmjFa23QF5t
3OyU/yc/oX5NUAOxZdJqlH7Cq0zADISzIH63hcbtPi0nNKWjpVzggKDYFoVfL11V
Z7KH9p07Fn7d30EPnTamI0sjoznEb//oqVag+LmRS6Ry70Uw6BRR2at2f4RqFr86
lkfa91fVVuorCBc0OeBplcGX8mjf1ivs3ib7yFcFFpgBPLmdeu8RsQv8K15IN4kF
KjksmsXFzVI6bZgRVPk3kAub6K44e7tO9AMrtZKnLT8zUflRQbSpBALsp3QiLOKn
VNytsAo8vaZlU6sTMalFZIgKkO71nA==
=D/tb
-----END PGP SIGNATURE-----
