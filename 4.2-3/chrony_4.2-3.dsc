-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-3
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
 0f5de043b395311a58bcf4be9800f7118afd5f59 578411 chrony_4.2.orig.tar.gz
 9934ca9021c369c174b4eeeecf162a9d2078c4f0 833 chrony_4.2.orig.tar.gz.asc
 6ffed650dcd903f434b4bbcd3e0f90b03a16b0aa 40832 chrony_4.2-3.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 ea6eba0197ad9f1dbdcb283662cdb3be3997a2c8fdba93ee95b9c4b09570e73c 833 chrony_4.2.orig.tar.gz.asc
 dc5ee70833835a581b2b843f2d68d0b53a3fec77990b161d38856988d7b46be7 40832 chrony_4.2-3.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 af3e056ab8999a52246f684c929701a9 833 chrony_4.2.orig.tar.gz.asc
 c3f2b4292e39265a517e21a6132acaa4 40832 chrony_4.2-3.debian.tar.xz
Dgit: 14fd5fe4758f167e061f6d79cfc0951269125c59 debian archive/debian/4.2-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmMBKaoACgkQnFyZ6wW9
dQp/rwgAh3+1e2u5ysxwy0mKk5inHAQP7cCjOaFF1EHUivW/M+gIufNzDmSKR5B/
XwBzytpTV3DxLufTPUEihxFIv4vBNkvDHs48J8Hsxt5ZofvC0BQ4Bzng50zDdZYX
cn8ZP45OKlJ6lZVlBfRU9BqkKuI8EVFvaj3P4/ijGMCWaQ2ko5X+UZgjM2d9e9Z4
FHGuv224v22GGUnn371EW8Jiz8bR3H1AYSwdkI1E6qZOk7lv5WYAVkwiKWP0ZOiP
PildQBbwsrnr7pPoxlMaopBb43zbI0JMqbA9mNa77/ztqRI37dK+CCYd78tjQl6B
Gm1njPq0667i/ou8GglWoZiEMFw7tA==
=yOzh
-----END PGP SIGNATURE-----
