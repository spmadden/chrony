-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.7~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.5.5-2~) [amd64 arm64 armel armhf hppa i386 loong64 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 2ef9a41611750ed401d79cb7358cd8d07e143a8d 643561 chrony_4.7~pre1.orig.tar.gz
 0281c00c6bb46836c9e52020ff2f4e6784431834 833 chrony_4.7~pre1.orig.tar.gz.asc
 feafa17544117b00ed39750c89d09ba22db71309 42124 chrony_4.7~pre1-1.debian.tar.xz
Checksums-Sha256:
 73774052dd21c32f8f58ec87227104f534a8b461b19b48a0a2bc077bbaab4e4e 643561 chrony_4.7~pre1.orig.tar.gz
 f7ba5ce7533926c004f9cfa1b18cf6689fe47d613abe14dbeb6bc05d3a4afab4 833 chrony_4.7~pre1.orig.tar.gz.asc
 d88cd866f0db72db4ea2d0f8bad8a22884cd8a5840b4955450370db611f2496c 42124 chrony_4.7~pre1-1.debian.tar.xz
Files:
 b635428b411b33ba388e851f19b3cca2 643561 chrony_4.7~pre1.orig.tar.gz
 49444aa6f35689e819d58373f0f8daf8 833 chrony_4.7~pre1.orig.tar.gz.asc
 b3d808b4db29e161ecbbb58eaef08936 42124 chrony_4.7~pre1-1.debian.tar.xz
Dgit: 31f2215ea442383230f9c7d10322343d13b3cfe0 debian archive/debian/4.7_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmgus8QACgkQnFyZ6wW9
dQp4Sgf/ZV1V8BotVagylr5QvQQgSDpMycfNRGI7U4TlwRge2XB1d2lnUUnBvIPt
05YwHp1kEoeYD1c2yQS7lkwdLi7jl4EvWA5L+IbirjEJqAdp27lgh4E2clbTD4A4
WRsj/A1hbA+iMcnAN3Q9gWmCAqUtpRMHVbAjS8zkZKFY+aSShDXfsnXaKWeQn5Cp
dA7MR0mMwS4Qp87+3FoRoyWTpqmLgdfVaqlr/n7M4R5sUb5A7WRp2TOFNzGv7PpY
0xSdTCWugHzGlC6vm+30rageHAQvXhk+DGUicS6tpsrioT4wZNxEIWefYHcszMql
lEulGzukWulLpNzgvQqNSBLYodJQnQ==
=7CfE
-----END PGP SIGNATURE-----
