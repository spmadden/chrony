-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.3.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], net-tools, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 a7fd28cc1fb4c61b67e2e23579537af165bacd15 454802 chrony_3.5~pre1.orig.tar.gz
 a46aa64a183837b01817f3728336d67214b4a3a5 163 chrony_3.5~pre1.orig.tar.gz.asc
 6095023173353fe33565d455f50374924aae99c7 30664 chrony_3.5~pre1-1.debian.tar.xz
Checksums-Sha256:
 0d0efc35d6fa7a26f7e5d10e5c743d14fe40ef12aa8c6f9d5f71d50eda144d61 454802 chrony_3.5~pre1.orig.tar.gz
 0939c92086a4b72a0953b83ff4df61ee2012f2b73a06771444dd30db3312e301 163 chrony_3.5~pre1.orig.tar.gz.asc
 d88f83c5ece74d483afb106a2d6e0e16b9a8528e511b477a2778ac5b4177193e 30664 chrony_3.5~pre1-1.debian.tar.xz
Files:
 7b1e296d7d0ddc68daddf9c33aee5a08 454802 chrony_3.5~pre1.orig.tar.gz
 af9dc1d3874efecb6226cb2e38129d38 163 chrony_3.5~pre1.orig.tar.gz.asc
 fa4dba194fa0a22d489540c532e29081 30664 chrony_3.5~pre1-1.debian.tar.xz
Dgit: 260ff57f4f8b263a23841ed67a47e5dc08981f3d debian archive/debian/3.5_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlzZzdkACgkQnFyZ6wW9
dQqCZAf/e7c0A5JyD1dMhIsmTpWugoUD4ed2x7sT3qwLh34c/GJKMfJzYr4/X04P
xG1UtwsQVRNXMpSXR+0LG+jOnqnV2zzkufKQkcRUdzzFLDsuccZlpGezygTTCNns
w7zZQaUFvgsQmbmuXPYGlBgExxYXMdZ/FNe64Tvmf6pttDfALORF4q1l4D5RVYev
QkkrR+5j4rqFSJcSifCi+2tgJ0Kz5Ol/7YcXrCZgYrcToK3eS2cRRQtUL72IFPRo
dczgBlvUvAYXiMe2JGfoZ4R5CY0M107Ibde1ykHkWqXP0b6iJrZnWK8xQ2UPnSRT
0wo7Jta5b+L1R058TxZhb5eaBPOlFQ==
=F5o3
-----END PGP SIGNATURE-----
