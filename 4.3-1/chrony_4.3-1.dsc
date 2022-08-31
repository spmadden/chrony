-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 8d2eeab1030c08f89cfd4bdcea206c6acc223ec2 40120 chrony_4.3-1.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 25286b80974aa017fcea660c2abca0dfed0d1caef13e766dc9e8d03fff5b7da4 40120 chrony_4.3-1.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 fde129eefccdf7ff8d29ea9d3e5d749f 40120 chrony_4.3-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmMPmRgACgkQnFyZ6wW9
dQrZRwgAp4dfTw9HSOH00Hxyvv/NeaGFhOdu2ndRe3MqnORebf+oaLs4xDPVl2D0
Bk8hxlkRS2zgv7NS1e1bAGTI2YK3dzxaAwipFb6Ho6ccYuLWP6eDNR61V4ob76bj
agALL4am1AToatxxztBrHeT638l6PYbo6zhwG+oI1A50D9faDkG7hI8bj1YCqj7P
sggZ6FkgZqxaYA1g/eVPMB4IyXr1MvTekx+lZ65yy7556lUF+BDerf6PNQB7U2vn
ta0V/Sfc2wG6dccT0bqC8VdUwPizpoFWuEHfamvgJPM3P1NyM0D4vuv0AxVFPo8+
KE8XNJ5/RG5yEBK0DiQxg5WWUKI7vA==
=TAQP
-----END PGP SIGNATURE-----
