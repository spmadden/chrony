-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 5779c39288cd1cf284d79e7187c891efa43c1ca6 36808 chrony_4.0-3.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 0ff168b42d57b8d065bf33a2d632da4c7446986599766181cc2bebed6e2cc051 36808 chrony_4.0-3.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 11b38e3eda86875b28cc53aaf12bb1a5 36808 chrony_4.0-3.debian.tar.xz
Dgit: f16a04b9906e8fb27c20f34e35370d29750f6810 debian archive/debian/4.0-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmAHReIACgkQnFyZ6wW9
dQq8fgf/Q5587R+e2LelhlqzhKbBnX0GsMkxea1LFGUtDUqizsEJMi33wQENmyOx
D6R9Xn0k0eErFj6rk3cjXHKzeKloEOyXjGsxo5utlJQ2iYCLUgXoborcavyZ9BEs
DsxVN4b5xzSxpikoICvBNVVfzs8QfIQ8leB7fVqbpVMfcjmPhQjjfuOZv0y/eJ1X
x5vGvvLDSCxkVW3aynUnGCHL0nasLX/80MeNLlrYMbUoyiTH5RDjBni/hU2CJarr
R5aTDjLNZXJVBaUfFJ58byQgQwJKDZh6fBXL08ExXUAUrYNXmyfW8240UKtxopbv
va2F0rV6mbKLui4TVEzPPVlaq/HvQw==
=nt4K
-----END PGP SIGNATURE-----
