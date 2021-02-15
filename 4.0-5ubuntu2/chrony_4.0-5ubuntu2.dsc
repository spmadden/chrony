-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-5ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 f5facce01163a0d2b02875b2edf2410eb0728f3b 43004 chrony_4.0-5ubuntu2.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 8b970ec14afcf52ccc12bc227b68e6feed0cf94518e6cb39fe9270e653fd4262 43004 chrony_4.0-5ubuntu2.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 d4b8e4212accb3f30994201e782012b8 43004 chrony_4.0-5ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmAqYE8ACgkQuj4pM4KA
skKFlA//aEr0d+HPOCKP0jWDQfvkRr/dCtYxxU1BWuwzzBf7QlgJkl7yXzQcPM8b
94OxifUZwXBNdFaBk3E3OrcBTzsOgmkR8FBxecb91NqHEVKGLDuCuMSg4iuztEyz
Y6OLtT9mAiiFpfianuxdRW/s/E+6TNRx23Yg9zfeKCcwbS9zgUoQeOcPuvT7nY4a
5f4As/fci2mXHU+kIY6PIhtaCMcZvp2OEZc7RL9Xz9vQLVFS64+km78LT+QZ2qkc
C485vMXeyXy4riLXeK/8McXKvV/789RLWi9hf/JiwWClf4qT84ryxoEIRvx28EfP
b/7wHF37OBvDwMQEifT7ARhoaQn447fnn/CHYb33LjsKKQMMnctv3HE8duYprjSI
k7OuYMEoKwS7SqMuxVU+MPLS1KfWnAx4v5n2ZRYIjA+aSlfz5Q173GjQjZ/1YFz6
VDbWKYg2i+jGGGgA+SLDezvWvjYRxaDz7RwgF1nv3ZN8se3saWZc4Vi4J6hOwRhb
5wCWXHpcsz6K4Xle8daYAWywd2iqry+xut0deM9QClMfraO1cQZH+NsOPKHNQAGn
jzayaaMwHvh2iMr+DAFC/IMc1r8wQgFzykMZ6K0vE6ZHEojdfa+1gh+oojypvjvA
1kg3ujK6CDGEMKfUuHYCcp7gjBCYMBFN0F/2OpfieZMFvgGPcQ4=
=lxr/
-----END PGP SIGNATURE-----
