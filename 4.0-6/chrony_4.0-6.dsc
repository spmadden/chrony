-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-6
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
 6fb17dff519cc8422e054dd83612d4b97d46e5f6 37388 chrony_4.0-6.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 915446361876333d36e771747312f9d797f54c0261e00609403512ce213e0f41 37388 chrony_4.0-6.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 aa2503c131c797c90fcdfb2b763b9f2e 37388 chrony_4.0-6.debian.tar.xz
Dgit: 1cfd1cebc78c38d2ee171920e9f13e387736dc9e debian archive/debian/4.0-6 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmAz9mcACgkQnFyZ6wW9
dQrR1gf+MEwdCMa6fNKMMwS/AA6ZiB7p4n8zKZxP6dznEMgBSrXzyNVeLorYosh6
aRlQxdssb9mUGzMLJrwLMcqxw3YPqCWJ+PWZZco7cjuo4gu0HFsGN+GqcAy7uofv
xHWTx7fVfvrY5kdhk5FrA0eM4A3Sl0Y2yHf/vJcFOkJwVqb/S8QKJsQvF4FI6MLW
hMUY/cVIGFSAXXoO7KUvqkzc6/VxE29ylQxLIjnHKXMxtv/oQULzkDdKAJQiGpPE
bZIUiHfP9x7hrgRotPaVKF5Rg5u2nArIFu3QNbtXJpVxlL2w4LhX4RMpZZpnXGCP
DLQ/4fyGXfH0OWdx0RRPx4oWV6bUoA==
=wCGv
-----END PGP SIGNATURE-----
