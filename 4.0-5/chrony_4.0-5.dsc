-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-5
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
 87fd70d492b36475ae9848332ce45ca5182bb6bd 37104 chrony_4.0-5.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 525af6a8bbd4df2971e30057e221629c0efee5116e21243c4d3585728bf6ede5 37104 chrony_4.0-5.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 749b52331c565cc58dad9ca1956c4294 37104 chrony_4.0-5.debian.tar.xz
Dgit: 8084732df4a7b05f836bb1833a36f1111731acc8 debian archive/debian/4.0-5 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmAcYToACgkQnFyZ6wW9
dQqZcQf/fdMzkGWwemo/NtMzLuuhLTO1GESh/L2ae4LD4sr8E4vPMTX6lO230J/w
nN24qfEWqkCN2dcN3Cp1MrRP8SO+8O/42miwEJJ0spBwdzr5/ixd+RyJZHj4OTRT
da/XhD0c7EaJprwm9D3BTKH/XoFUtQY2W6Zvw9w8fGR7G20lC6tIQRk1RKHfpAJ+
6SgW8msLR1L4BOzndxHmzD3F69UsD2/Op1oi6CZIMBhxK0OSGsAA8hKsWaVUejBp
4rxYHEdm0EjFR7uUqLkEId7YTrqn96yd+udHrOBkRjaoT5mpfeVTHi8t74JDdm5i
qbcXrNiZYRLnx0oXqqNkm1ggJWAerA==
=5STi
-----END PGP SIGNATURE-----
