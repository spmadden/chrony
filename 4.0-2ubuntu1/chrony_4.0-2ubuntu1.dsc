-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-2ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 17c7defb6e01cb5dc32dd9947408da05385631da 39888 chrony_4.0-2ubuntu1.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 60f520e3d81de20d9f3383ca877d378bf9aadb767e156bf201dee3b2728d2191 39888 chrony_4.0-2ubuntu1.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 f0655a4dcbf6a3eb26a010875fcdff71 39888 chrony_4.0-2ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl+iZhQACgkQuj4pM4KA
skJqUBAAk5MMSS0pyufw3aAHQB6bCdobqwzOaxJqqz8x41QCUddF4L8ChXGjRoUQ
jZZmzIFLfpSOcAe5Fh8d5aTP9ijOtth3g5kH1kgDeZELdTGIQTeh0QQJCX4NYDYh
U7d0ZrSxS83IuoPmjmBM2+cpaLGXJXLXxWlrLRL6gDYCKqHjjPAShoukQofObcKV
uIKGJeJipFtkckuPtwCHhWbFfbCPxjiOcNPTePJcwy7JNotS29hLl4Z60sziCluR
SrrwbfPT7OcNoaa3S/hB1xFW/q36wBkwlb0lVQjpVT7TPnlhkIMpupd1TQw4yEyW
NrXk9LgSc/nvZTC3LKfVr7wWFLcpUNQqzV8ZjbMAxxsikepCJpUgZT+Xu1BLomhU
MNg6xMvxZ+uqpzI01UVz3UP3WWpW+rT481y0UpSL1QigOrvTU1ACvmIbfSUymNOM
Oz69D6aJLKrf+YwlzDk1ATIGPQeeEIsdegIl2xP0JJbyK4HWYI1L4CR98NBayPH3
4f1ae24uHaeHu5Ind+dsO63hPTnoI9zpIJMLnpx4lbXdMnX7tMTT79TNbMM5AM9+
GFxFSzQTi9h1XMhBbCaA30D989q05ITJ6Y8HYYmf2SQF3a9gv14gYPbmxXyLbfUp
3GuOzlltX836RZS3E3JMrnVPe3TRwIg/NegKxZMyyonU0HwqDBk=
=CBA2
-----END PGP SIGNATURE-----
