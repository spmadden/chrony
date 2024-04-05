-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu4
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 6c46757ea8020a5226a7f3df1f2fe2d549c13d06 47264 chrony_4.5-1ubuntu4.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 8dc50bbae1ef32a0f58a80d8d2c3542321b4804272a72600d3ce8550ff49743e 47264 chrony_4.5-1ubuntu4.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 6d0c5ebe0c636d1e6bab0ef7df970198 47264 chrony_4.5-1ubuntu4.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpmEQCz2sHU8srYpU5gOyV4+48PsFAmYQWikACgkQ5gOyV4+4
8Pt2lw//VX5uyXTCD1l5R2gaOyTrEYnN06k1u4DAoEHQKiQn4D0eLkJyWRJbbw8W
YZBUQWN4qbQAdyAMXXmPdNam4e3F2WXmjUw5W7hrB6X6a8LBw3ZDcMeOW8TM/Rew
KndL2cW50dPxXlM75KTj46ZCjZrrn7E1unXzdh5M9RZVLacvMrs1kqVhkw30dhg0
NMVh1r3eWPf+hiDs6NbP5uOB7yqnQTW10YIxHUxF+UhLbJqL/6wvvdGFQwrKnawo
60W6ApHdYGQUAflurKFBUP8FD11yLc3J2r53mAvhD/TuUd31CDK7+LgU2fmxOd9K
V46bBjaLNEJhyv6AFENgSsXGWy3WlE6jrSXfXOUZRnkO2xtRF4kKLYzYSb6toNnC
AFHW6HACrfSmkQzQxHDcc68R/CuxHo0dwrFcNs61S/UAOrMSfKSDzKEcO2RNLCqR
SU2yBviibNe6mfq2phF9y9Q4g/rkWapEFLwXK87wCG8k05u6A6EShho0FxCL+3yC
Gu2hUgALjd4Rhu53rxYDtMHUFVawqtFWndHmrTbKhz+KU9vWlHiyOXxIuj+MAVbD
fL4sA3uOmkekIVKPkz3lpslFkCW15D7wloqVJBSyJ9YeZMx9O+Lm5seQf+hvmdSb
p9bsPJ1Wcs0hbPJM+BHjen0+ERt35Y6V0tkWi4Pys2h+aNl9+YM=
=IJLQ
-----END PGP SIGNATURE-----
