-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.1-4
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 15dc1976653f17d290b65007a4779e3f4ac1833e 564648 chrony_4.1.orig.tar.gz
 5871317482e051cbc58574115d2f882a6da3b0f5 833 chrony_4.1.orig.tar.gz.asc
 2ce57071dcc0fd9020fcb231bc99084aa0993c3b 40092 chrony_4.1-4.debian.tar.xz
Checksums-Sha256:
 ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c 564648 chrony_4.1.orig.tar.gz
 d1768fd1a571fc0e37a4e6f04cb1cdace1a38610e000785b577c2104b9bb39f3 833 chrony_4.1.orig.tar.gz.asc
 819c3455c4f48740933f98132ffa9f27157c4b773530576e4569e3c1dce35a99 40092 chrony_4.1-4.debian.tar.xz
Files:
 7133880806887b629678c36a48217806 564648 chrony_4.1.orig.tar.gz
 0429633f2aa1dc1a6dc5d937c411b8db 833 chrony_4.1.orig.tar.gz.asc
 4b6cfbb7828001408e41a49a2211c465 40092 chrony_4.1-4.debian.tar.xz
Dgit: e728a06d871913276c2e1f342d6679268a334002 debian archive/debian/4.1-4 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmFfD8kACgkQnFyZ6wW9
dQpu4wgAkCWQfAllXbAQHA6gSrDbY27SD72PSbcn7oQCwHZsMj/0cofjv15VM+27
KBLRZnN+XRTeifrgNTgFr/XfIIeXoiqa5xRq0txJRFoUGWPVUN1LgUJe4EjCj/v3
yXN5b5xJFzecq+P0rYNQphvd2yHQEZiKm8qOXadOZDW7U6VnduY6zofXMuQdaX0l
/j2YPd08IakbdOXN0rDRn+MOnqPe/xl0NXX6FFlR51bq2qB8krFApmj43tS/EHu9
oivAJp2V95HfsyruypKxCOQuPKOVVAEX5Arp1Q3ObH+pFBey8rcIgWMYe1Jnm8P4
K1HFKEGKQldmQ/XsYlNrNkOkGLoPog==
=0W+n
-----END PGP SIGNATURE-----
