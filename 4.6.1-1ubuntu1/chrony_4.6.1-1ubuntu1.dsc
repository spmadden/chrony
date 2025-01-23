-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6.1-1ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 35b070fdd446080232844ac9f70f84ca1823206f 636076 chrony_4.6.1.orig.tar.gz
 6d608c548a0fc8253816016176b13f0f41dc5bf8 51596 chrony_4.6.1-1ubuntu1.debian.tar.xz
Checksums-Sha256:
 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c 636076 chrony_4.6.1.orig.tar.gz
 d47cba20dca3cee6aa989b6d1dfd9df7bf914249c3b88535f5bf2d49db60bf67 51596 chrony_4.6.1-1ubuntu1.debian.tar.xz
Files:
 81a83f54d5f8e1d5fd9afcf8a40c493d 636076 chrony_4.6.1.orig.tar.gz
 ae04f023f886eaf7417dda6be4aec6f0 51596 chrony_4.6.1-1ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAmeSRjsACgkQAaxLQINZ
CpiWTRAAwUTBPt1dv4CtkPtJ5N34qnXAmSG0FOprWZt5IUmMOeVSf5dmVxD85qxg
B8rsgH2Gd+ziWphqn0m7jIFxzQo4cTKQUju1SBUbDnSRlIyVRzzjTN5as3dAUiCo
7OGUS3azqpYQ5yAB1j4W08gYWrEGdbXpweIzOOoZSWF5Xqj5g76/guu5ykXW/psV
aiNGODwbdpVBfNwDuZKbA3uKPq+i2wqu3fa5rOJ+dgmu5OrQwg9eSulw85EWlthm
M+QJaciGpX6+dzts33qOAOJSKwCmbBJT73IIM6e8ukUaTmBlAlJfGzaFJerMF5Uw
0yK4TTReeJS6EJ4Jh3ehIdZDUaoMwCc00vt0dt/y552UTaPNXp4mOYxxI1mb3+Mc
Hv1CU8bMjevq2W9SmNjx9uDe8/W+Cj9fQcFQt2lLNO1+UIDoPvkVJT24bsQRGd6a
nE+uLGHr5ilZdncKhDAOXObkIpSsLQZ7Xvm8phLS1UbOXUWGBQVBin1fujAJBiG+
e2+PbM41Jnvrhz35Spsv2zC7qro5pnQDXA8nqT6liqBDlUPA3cSVxfJyO/oMlFZ4
Zb3lyVuC+oFPP1giTNc1HioytpB1CYC+VwDTJqRT551QJWlYQ9czHanR4f9KLRPj
A3cQnLZ4srcN8W2BFwQEBXdLIbtT5teKxMDb5ipKbnpiI9ZRPqk=
=DZJw
-----END PGP SIGNATURE-----
