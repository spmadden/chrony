-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.3~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: debhelper (>= 11), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 cc799c224a8410d11647a93109fd8b3ce05314fa 438461 chrony_3.3~pre1.orig.tar.gz
 9cd3c4f82cdeb28b76224d406c353de05b5dedf7 163 chrony_3.3~pre1.orig.tar.gz.asc
 7be459b1d019703d50f86dc2c6c6497e6779aac1 30920 chrony_3.3~pre1-1.debian.tar.xz
Checksums-Sha256:
 4c8fdd6be2622ffda05efd10ef683afa345de5684652377d2f22c84cbf5ccc27 438461 chrony_3.3~pre1.orig.tar.gz
 3c94e3cda477d290dd1e2fb7a623e57ba19ce3f571c85a08ea521806d3f3a3e0 163 chrony_3.3~pre1.orig.tar.gz.asc
 369e93fd239fc67d2cbad803404ca535e00a96425f16382cd13b61011ce06912 30920 chrony_3.3~pre1-1.debian.tar.xz
Files:
 02aa5c7905186816fc3b161b9f2d4504 438461 chrony_3.3~pre1.orig.tar.gz
 991b7ce102f4e756fa5340149ce9f9ad 163 chrony_3.3~pre1.orig.tar.gz.asc
 b08af361b389a9396f369628ae61a290 30920 chrony_3.3~pre1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlqqsrcACgkQnFyZ6wW9
dQqnFgf+Oac2twOb+secpmQTO2YIOpxjUNxuv2yelDdyLoDE46MUFAgDXRO0hAGw
AlShx347iq14KlbKKzn/lp4d/nPm68/DloCsqzGVjT3g2D5w2IiEdaN3szicpfXa
Rv5x5+O7bAh3dpL8LqcMPjWXj4pi+Lnfldz9Io+9Uygq8eNhzEI9t5llT98qqjgF
ZJ1rvTFfmhCwuy+4XXlw+uj8J64vY9ZlE6o88b19eVuwj9egqxAG8THNksnwUuby
06YRdv70KOZnA+sTdKgUT6FLtERPiwfms20yi57NOFdPfq6TMN/o7i8T/hAUZcgf
c54LMvcFcdQigaAReuVbrqr+Bd3YZw==
=PJyr
-----END PGP SIGNATURE-----
