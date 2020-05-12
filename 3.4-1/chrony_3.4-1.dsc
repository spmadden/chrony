-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.4-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper (>= 11), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any]
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 fa41e595e7041a9deda76a69e970a023091474f6 453056 chrony_3.4.orig.tar.gz
 470ebf89640f8cafdccf7605e82d0b5147af8ee5 163 chrony_3.4.orig.tar.gz.asc
 5a7fae3c7cd77b80257bd6bf14e50cedcfdc0e58 32212 chrony_3.4-1.debian.tar.xz
Checksums-Sha256:
 af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f 453056 chrony_3.4.orig.tar.gz
 4c8fb3b296dcf9eb064bad50090adf054aba2dbf15cef16bcc379b9ffe624e67 163 chrony_3.4.orig.tar.gz.asc
 13f1a11e0a220d89175ea160dac843783e85f5407e61b899c24a6c8750f47dfa 32212 chrony_3.4-1.debian.tar.xz
Files:
 7170e750469c198fc6784047d6f71144 453056 chrony_3.4.orig.tar.gz
 407daf2474c7b08d7c7acb84bf60901a 163 chrony_3.4.orig.tar.gz.asc
 ca25e022785854c15d12b074005ced0a 32212 chrony_3.4-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlulN90ACgkQnFyZ6wW9
dQqVYAgAgG35bbTbikOus5hS3jbumb2n/W28y2u+5/20zZ/fjEVNdvLQ4C8UiDAP
gz72QPQwHgeqKjGE07+kgrKSkkw2QOX8cnuhSlRBX3Xc40K2xIzCnMvWJox5zH1Z
5EdRmkmk7nKjWC0uxcXiCmlEGNpaJHzBGbgFHlV34b8PMLpu+CFGshMztE11W8po
c8Q8K587xhgebzQuMlr26pZKkApAC1IjtvSpKaGHYUxwBwOe8mcLm1Alp7ZJ0x03
LdR9KU2wppKMbukvdYCbimXcrfCVwLefjYlVPQbj7h9yoqNJEtcRCrUvXoa/38mL
SXx9fxxr5rAI/DIgfO4F2+IdCJQBYQ==
=G7If
-----END PGP SIGNATURE-----
