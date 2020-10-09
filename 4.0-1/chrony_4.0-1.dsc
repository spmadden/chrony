-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-1
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
 ce917580e7e72a5596526ee8ea148558f3af5deb 34820 chrony_4.0-1.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 e5fc1d9896f81d9fa918c488f04065577f2deae25cb92b3fb6ce13d50c8e0847 34820 chrony_4.0-1.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 e73bea701e14a8a668000d7c8984c509 34820 chrony_4.0-1.debian.tar.xz
Dgit: c12c8f6b9778c22d8ce2c5368a55c72e69716168 debian archive/debian/4.0-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl9/VgIACgkQnFyZ6wW9
dQrKCQf9GOb3u79lTR0jsrd8GKkY9hd9IMu5BLWSwE964g9Rm7xzEXg89LNsXfO3
9udeJqDgy583lN3kor0aTLWYzbocU92+sUswv55/aQOZM/wc/Lc6fAYoNsj8nIqU
2E7TcRmCazhjQ45qY5IDPd8Tx1pBUPgdvvVEgFbBhzzLRYvTgxn1OrrW3s3n29JZ
5bUpWH+Yg+X6JVdKCrmGp1988WCEMvNuaktsuD5me0b7nK+dIfIdyjVUSQprBder
LmmNyI/kdJUe/8M+4Bg9iBFO6Gsd8kX8hBrCYUQo8SAoOSy53NDY+mElwW2T4+DU
oJYxEtotVfHzSwh8Nn35LVu7uMrB3g==
=b9nv
-----END PGP SIGNATURE-----
