-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6ubuntu6.2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 8a7ebbe8dcc7ff6d036ee20747ccc979557f57cb 43572 chrony_3.5-6ubuntu6.2.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 99505c68092e09baad16e7d35679be4a8811bcde7a3b8e8025f8f13e7876e5b5 43572 chrony_3.5-6ubuntu6.2.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 f9d62f8765538f6a7eb97c7f086e9424 43572 chrony_3.5-6ubuntu6.2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEf+ebRFcoyOoAQoOeRbznW4QLH2kFAl9FPNsACgkQRbznW4QL
H2m88hAAsbyh/Phskedw3emYZ0pyl+/BMujp7WSDz2WMkvn8HvRpB+0659PglXyW
qgopuPjarpWGWp3JcApbqwgXryE9BoW91Myyzt0iT8v40lZ9ML+bYFRZbeyWYQF8
yBHCpFrB9VKmV7US0a/BOJib0BsJS9NvnrULiYKCDrffbGACtOVaFglIK2Vo8nFi
/7mC2kwfV7nBORNctNj0K4P27Am/xyo7O0qiShvmItd5/urLwoa99AgCd8HXYE/6
q84BqvExmgtCAk/2z4R3YL6pD/PBfMoECu0/S4R0NRS/9XBtBXjPoAaEsTXvRvs8
mL7loNEXRr7l0+9vxVTinkKcaW60NZ9uUdN3iu9FkvhqT1wz49AlqLKctRl4bVFY
/AdwlGhMdzCLh/nbniNRqBofycPmwWqxHcEBu9gmJsYo3XAXVurLooAN9Sfwi5Xq
C88eAS5zv961BMJ9+1yT+H0l0ZL4t2zUqH3VjWdtnpc+ppdir7eTTAbMABFGKkwr
ta0lZWnNNOzrvx8HkXdjm3hMjhW9zce7cZ7kTQ+441NivwA7003/SV/N8yMMRGss
pwONLILxvVCVT3bLDHs2b5oSjDbKmMEb4z7KHre5SGzI5NfjxR3CRWDGP4FWzOZp
r4ND42124B9zF+os3bNHIlGocYesdf5KxqmdGL4lkcrNu/DCeAk=
=ZN9s
-----END PGP SIGNATURE-----
