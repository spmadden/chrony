-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-1ubuntu3
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
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 1a2f1fc9457ef37421bbf1f5d99cc77e6a67988e 46016 chrony_4.3-1ubuntu3.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 4b012f11586c27e52b8f86a0882985cae1b240ead6aceb7537ba18a5591a0011 46016 chrony_4.3-1ubuntu3.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 f5ef8fbd33ff157c9f06b87f1939e04e 46016 chrony_4.3-1ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCgAwFiEE5/q3CzlQJ15towl13YzVpd6MfnoFAmQRk7ESHGJkcnVuZ0B1
YnVudHUuY29tAAoJEN2M1aXejH561sIP/0SP+ZvLwAq0BEVceLMX58Xa6t6yNrRM
jwX+a2ORbME6lYewN7rQiTPIhjXvQm/6+5ng2Mtfwlyb8SCd3vK8GqrloEnEwTsQ
iYtIehPWaMc8YkhcpyAlyfLmKvIPjmFni2YsnHWovGAZjNdWhPTTgIO7xwjTQJ8V
CXfYZfhCVgQkGunZu0IicxskWm8/lBLBRY4RigwbEqW5/YPRLucDaMGx01ZndUs6
o8mNiIyeNC+FS8gmAQK46EufxJvWMohacuU+3FLbCpIBX5m9K6k1X4FHiBrLU5n8
xEockWmW5gBAzVLTdRqrKCVlf0nfaXPzK1uQ3iLML6ZFIsWeWML/N4z5mY2tp4k1
0oRrJdha4qPlZajQZ/CRU0DzzXCESxijyisSsHYV8TSzfYOEKxO7nw6G4/xOV1cS
VSSLaSSMYRAqzTUD4NglP6+wwweurV+Tg1CM62ITi7tnK4E8q/eUyUuZwRT6rfvG
hPXBTSUAxtfTUvUdGpJIb7DDpFtp+a7Y7hg+4hWxU0JkDb0x1HGo5XRby1P2J/+a
d0nZQGuoisvBMv9OfP6pfER8QOdbIH7xU86uE+0J/L5N4Il/ljMTn8pS8rcmTDaz
szeSQwT3rx66I3ghunyDCRcNY+tBjL57Ux5Bn/7KdczXvS/578U4Ay+AynMsyHhy
FfVICAtGymX5
=W1mE
-----END PGP SIGNATURE-----
