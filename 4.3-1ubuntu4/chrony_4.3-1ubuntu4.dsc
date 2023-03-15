-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-1ubuntu4
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 108c33867f1e3546a4604f463abc7ed7db02efa0 46048 chrony_4.3-1ubuntu4.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 204ba0112de9ee065f71c4ad783a8e67b03cbd47135a73459e44fcaf6753b4fa 46048 chrony_4.3-1ubuntu4.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 11c2f1eecefc2f792dd502dd7ce4900c 46048 chrony_4.3-1ubuntu4.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpi0s+9ULm1vzYNVLFZ61xO/Id0wFAmQR2ZYACgkQFZ61xO/I
d0zGPg/+Iou9HF+ol4V5CizBvGiG/BEZN4vHwvY0qf4DUjT/2IcybRwb5e2DD8tf
itWvNHlkrqaFzA+fqoHL1I6WOklULJxHRep49xeoojaMC+GGfhcb33YPEuAE7yDq
zPPioVWw+Q7s+8Dd3lBFbKD7/cdaLVIkPSzsMtmKwrO65Ru1OLplXDvFunCYbmpo
5/kNQYR7W1+iI489F54YI5fHP4ATNgyWLEBSWGnq8LdFTWHWTYlIuFC6iL78veVc
Yyy4wwpZBw9yPMEqLN0x1UBMXNiaRrvfoLMsqyCPaz68owMqpCxEI17KHnUHSf7t
TRaMN27mDJTRfWAo+HeIa13kBnpFE4xvdnqwmPOYp/uhBg3NM+6DoqDWIyaYIGto
+NSp4baAZ9PjK4s/3tx68giCkmFCw9+J1cCKnxo/Bp0VQqSeppg9eWTn5OIRTZxb
9Hesjg70/arJ8XAQLJXuaMK3+HUwJmikgZHDMPJ+dAXTsGStOaj6w4ZZSlwxw0xP
/eRzrmCwaBFkWhpgGsS0U0rKA5H6KXhsR8hoNfSKoECVUwKMR1goWOmhVlH+rbcd
XFhzRpwZiW5jCMCffefoAQbNhT/19LNStvy03xmz+w9yecgALorIiJRtJSItEzIc
6qY24pk+2GP5tPL0bPQgyUdLLU9yuznvO0bCryzCdEcNQKKL76I=
=mXEO
-----END PGP SIGNATURE-----
