-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-8+deb11u2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/bullseye
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 8451aa4b17aed55ae17073a7b1aa108dc4fcde6a 39168 chrony_4.0-8+deb11u2.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 8e73012e31f9a2f14483f7d811b752e5b4d351d0a323574217d692a15c728b8f 39168 chrony_4.0-8+deb11u2.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 2e3776696ced3f46a400435c851aac19 39168 chrony_4.0-8+deb11u2.debian.tar.xz
Dgit: 79a312ecf1bea9c6f6348625782dcc4667f78502 debian archive/debian/4.0-8+deb11u2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmI0atQACgkQnFyZ6wW9
dQqMzwgAzG5R4XaY/ym+U9acNc0rbOEq/inWzqDVaWzPNO9qGdAF04GrNAJgBmb/
lsk1WQFiaNSHjJHy5TwWg+4Y4ToaVJrebDvWZv1op5AB5cb8ri1qqP695zwcL09r
UI2au3zGxuMedNOlILoYnfuldmR0B9bdtdTtahfOfp/9ppKt0v9R8sbu7hrvVRWm
zAlSF4qcIDOXL691bTPWIfdtsSCir6PXi8sNQ0R+EoQICUlXrD0TesuCmxqc7WHB
ladj1oBnJr3b4stEs6LUFq3hxQjRbV7GWB9Vaoy+qksl0Z2tKEW2OTcCCoACMOBE
blsfB4wVs/JDWpFhXWawIz6fwtLVig==
=7eHg
-----END PGP SIGNATURE-----
