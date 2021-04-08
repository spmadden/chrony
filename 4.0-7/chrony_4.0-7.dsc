-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-7
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 3dd5493d7385a9eba6978adf8f8f34ead154bbb1 38052 chrony_4.0-7.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 46fb7e2b4cf4b8d2bf1982f50fd2ba877cb6823c456990e71519cdd994e5578e 38052 chrony_4.0-7.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 d9633be14e66e582ec27361e2d102289 38052 chrony_4.0-7.debian.tar.xz
Dgit: 2026de9c43be6c86ffb1e7ae936ea1002de793fa debian archive/debian/4.0-7 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmBvOgIACgkQnFyZ6wW9
dQq+1Qf9FAgI4rt3E3Z/Nq82YWudyUMGN7olwBumUQfK7pF11DScxeljX+V4HmRU
gvsxFg0TkHLpyBU8FTvBNkwHcf0mn51Ex+FdGE8t2VEWBr7cgI+rQpIbW1rAXud0
Rw4oCdM+CmpO4feVXXzxHjFYt/zdHZ1Dgi1V9ibnyL0v0RSywRGeTGnc7VU6Sbm9
Barpw0UqA8QI8qeZoeMs5a+tGIwi7wjvHZLLYkxDTVqFh1buMmPerWBPlU8+03M5
dGw3EdvcQd9TZiAAjkfYHSNOAN9mAvOIqc9Jup6Hfm557sHU8UwMg3oMlu5rcZKI
OtOX6AFk4Sb2Q5S9v99nwTjyBrihDw==
=VXTt
-----END PGP SIGNATURE-----
