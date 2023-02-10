-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 ad08af756f37900f869a130073a373e0b30d7499 45928 chrony_4.3-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 71b477fb5ec21f6c98f2371acab6f66338569b15a2c2edbc5e82c40c6db0e828 45928 chrony_4.3-1ubuntu2.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 fa82421dbcefbd8c5962584cbfe21476 45928 chrony_4.3-1ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpmEQCz2sHU8srYpU5gOyV4+48PsFAmPkoA8ACgkQ5gOyV4+4
8Ps5WhAArDNxXW6O3eP4ikLEO3lAZMc3Vw/3Wu/X3ddhXf7iF2mfd8Xf0w9/zi21
ia9N2S5tlkvQjOr/agUzYMhGUH7puOFFx+IF8U0iHMv8EdqB1qQjAS76DkXzmFFT
Kz2krxRhrfMj0AlFnDJO90uRQkPCdSQ+U63MNZE7bIy4nCh32JfF4ctwMrBNhK9w
Qrqz38N1T0f7Y1/mjsWlCNerYrf9Sej+U98Cm2W9n5JE6RvpOahbCZi3+e8g34ko
LvomNXghBn0zwqgqf7tEuWOwD3FbMoKnsER3NQ2AR10bl18UW0cWd5A6pCEAZzwa
uJVOwF7wBWSCATxBq+nD24RHhSrDNyB0psD2lCn2rVct7ovdIdzwvf0d+3YaItiL
BGjQsv9ClsMvQeO6y6iBOOV0Ldcnk0vnUfCgsp3ZFQ8RvjX0zRShi0p6Te+JQ6D9
zhefGX1PdgdXqfh+Dy3+3PgBXgk5aHa88JB9QB2NaBdl7eJTqe7KT0kSXUX2RBaH
i3Ro7+42BFzA/QOg/t/GqFv0eOQi3UHCEsol257p8ZhQs9XyZ39kjg45IXJbcTeI
kvxChZOVc2mPufFMGouK/HBDtI2wuBrj5Ub6PHHQAZ77U+PqJ7vSpKKBz4SQS6AC
cKkk0IcoQuNumkBGbLkxiY0S74p6y0ruc+hUwG+WuWrmCxf6JwQ=
=l7xi
-----END PGP SIGNATURE-----
