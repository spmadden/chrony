-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6.1-1ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 35b070fdd446080232844ac9f70f84ca1823206f 636076 chrony_4.6.1.orig.tar.gz
 2e20498109e17ec0ec05b096e87311ab5973b67d 51912 chrony_4.6.1-1ubuntu2.debian.tar.xz
Checksums-Sha256:
 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c 636076 chrony_4.6.1.orig.tar.gz
 c4cb998e27cb660c548c64e39e9585afb8e834ec4e35f0bfbe9b1f6b9370d897 51912 chrony_4.6.1-1ubuntu2.debian.tar.xz
Files:
 81a83f54d5f8e1d5fd9afcf8a40c493d 636076 chrony_4.6.1.orig.tar.gz
 befe26c8120e3527ba598d92c83e7e89 51912 chrony_4.6.1-1ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEco7DU8UfXhRO0oCBM4dveyhIiTsFAmg+t04ACgkQM4dveyhI
iTuVmRAAkSHK5/lfW1kmXDd5qE8wCJolsjvJm8r/+zVttGpej7m48TbzmL08cV0T
sCxYEr9qAXkVjkO8tViEcL49te3a3bhrRRqb1w1xaLgYDzTp3Rf4SheSJV95+fwv
WL9ZaodyVT+dtX/ovkLiJe+tniqS4c5hJFCtayGbEReGOIp0EGoQM9PxDnxbQgVH
Dfq5F/ZVY4AuSODoLxLsc2WoL6fWwonJ9K/A3RLNvOwV+T3DRf+MB+J9isb4fkfx
17fYY2cF/dsXfFFpl6jOT8uGPu83yOV9zelPfKYOaUW05NYZY//B40jaYX9I+JBG
+pwSYnc90riXg9xX0J/jbPpOifrgfwg/HHRk4qNcF6hQSxLo1at3mhKarq+axaEY
1E/Rj5gZ4hYflRC62NUbMbQYv42xiAWF5RocA6hBOpSznn070DgXn8ksVJZaRkBT
RnzGp3dVQ1fOTFAzYGVrcTk3dpOCCW7kRL5+rciyBB+PbzWIZfAQYOJKPfk4P2kE
LiqbrE35omsFokUXUvl6egMaG8jwFi74Uwko3Z/Rz6HpUa1FTJtgcaUOkfNb5TMx
hV2sGIveG+5jit0i/b00nIk4AHMAXNSb4A2nP5K/5jlXVl9YmykkxLQCubswC9Yi
gXEQu2xuqW0sBywxIZz9aOVdZblLJpwylqiQBVXH/j5lYvHYh6M=
=sABz
-----END PGP SIGNATURE-----
