-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-8
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
 ad1fa99fa00bdbcfcc36005f785a9e5d3cdd1062 38572 chrony_4.0-8.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 3a92ccd7928ad636357a9ea4fd26d7577ed5e75c3cfd762a7958aaed670f5b8e 38572 chrony_4.0-8.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 1e184cf7aa250b5f46f1e7203e1bedbf 38572 chrony_4.0-8.debian.tar.xz
Dgit: 5eaa6db09aabeabcc1ec14e528430353265fc473 debian archive/debian/4.0-8 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmCn7L4ACgkQnFyZ6wW9
dQrfUAf+PwC0fatJWJB2Px7h06aAcUYHBWHVuu75nKtz1Qa9pODReE3k70EyL2n6
SEvwpCYW/dUomJtPiZoDEwFBXnPTSJHFAu52g7eOz1RK6ONF8lIfzsRatyH/hob4
7gAjPclZuDKxOzOlTJrCYOtZyybe1SAs2iRa8tN8NhOyEreEK7GFo81hjfAK0VMq
EEFeBPCuUFW/Lc1HUVlwdpB7bU5sZFds+vVXl0WhodQhDiij1qYyOo6/9qJdq1gp
fuXhXze47BSjNvR+9eIGoP+59HZ1db/DtjT7SwpA9KuGU7QpGX9fjZkNJdcAK3yB
O6j/gE2bj1tnZg3bVeJUta2UDQMz5A==
=PInc
-----END PGP SIGNATURE-----
