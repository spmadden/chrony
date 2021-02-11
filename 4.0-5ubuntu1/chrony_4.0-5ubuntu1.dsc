-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-5ubuntu1
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
 06155c6ebe1c6d9f60c83e08ee1c8718b50b80f0 42304 chrony_4.0-5ubuntu1.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 a6d4adccf9346e68bebeebac2801c261fa7aedcf2576278a8ba04cdb8c49ae1e 42304 chrony_4.0-5ubuntu1.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 7f7f9a8a1489f7f121a17c2876f98264 42304 chrony_4.0-5ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmAk5ocACgkQuj4pM4KA
skLh8A//e9sZ+TEFsCFeEKvfBrpv8WkKDDobBEzU0thqF1NtPmZ6KKTTeJcraiKm
3seJvPZ5ojtE0xn/59453J5Cy00g/rG8gBpBs+JlvpwoLHiOQ0PMP/eQFkYWeY6Y
ASEl1euq4Qm03CbtkGTcQ+N9o1qC3n2jbPoZk1tedkJea2aXmX07Jlpu28yUGzJ1
lx1U6TIuhyS2qY5Xtx7zZnrvbml4cupZUHUhFezTnpGZdHihVYxE4/T+ga47wmr2
6dIXIGTb6STMRGD69B6zf7Lq0u6QwarX962hzPDOv/DGP5iJjRvClbIXp5DpP8r6
t3oj2p5UQlgPr1t15bkyMCcFV0yovyLPNw/13U/yFJXnTH+60lZ3tod0Yxu0Zcq4
XhWHE8cQbEL5whfIFi5VVCmf6y049sU3bJxGVmhibkrX8XZ27M9ifqx/J643kPXr
SXIzt6kkOeZ6xfPk3j5nc4dJyuJY51/ReSGfMz0pzkZf/JEaXQ1rIpYHHpKR6MTM
QJgfrMVotzvAQg37p1cTwkum4HFAIIHOees9vE3VoktA45yCByIWaDaeoTQdiAF0
uFucggZStNYFtWCoSxdbgNb60rtEwu3o/24vVJWTvPosmhZvCA2VkWcufTg2muLa
DOZeKxpLax+P7XCbRzKmpZbJJZ8zw7ZUZuxJFW8NPNs3uZEpCrU=
=4VKY
-----END PGP SIGNATURE-----
