-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6ubuntu4
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
 7619c2fa6e0a0ee660c6cecdc1b3e267841e4a8f 40416 chrony_3.5-6ubuntu4.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 dd892810c227184f079d9304148b39dba265cd6515461afa3fb6bfcbb03375de 40416 chrony_3.5-6ubuntu4.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 442bc186cbef76777e9dd7f20d0f84b2 40416 chrony_3.5-6ubuntu4.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl6W4JYACgkQuj4pM4KA
skLLBQ//VTkAbILB1NabHRFHqgmhx+VNWD3ZA2uSTls/E/agQdof+w0CKOdJMgKe
hnPLCETVp+opgsvmDku5ZTUh1VO8H1IepdBl5q7rZuW7GSyLpt6NNia+1oL80UkJ
XSCqfE3IZ3zMgjDvXm0Bstvr+GRhnilDqbqATzQGkoAQQfO8cJ/aZgsvWPxum9Mi
irEMtvLDhsZ/KwRzmu49a7MMiOl/3QpwahmfGwAxFfDLAsLTUYT8OtcuP5Sxrk/s
LUxW1jDivNSdDjGqkoq7DNe/WKqC+Jb3pPmuaIL4/c2Ph9l9f+CKnboDklpRZodw
kmx7cwMP5kBQUO+/+1nIG1X2LCjd9CwLy1GS26Hay3VRuGOsFkFCY2x6QLbPujt6
Z5sr9djtkNAHs3nNGa3WAIeUaRCbvhVod5iYnH2CEWA1nqZGOti2o7ivyu6pP2xB
J7WgEaRQScUCiZLy0TzKBgYj/XX9wHmeW7aUVAqgYCe0tTq+R0SjpI7pmC9XzxpP
NX6GOVdZ76328OLRyFdKs0OGlU5vgc1YSh+wnvRxXs8PgH1Tx86qv/s3lHZxZXGD
BY26qe2Guu+7ZlCtK2LuAF/Y1D8wGW1gZ146koBafNcPNgaEVdbPR9tl/c430k76
efz+mop3JajpDwtgDcn2TNmtRnxw2MfyxTFPNI2aBFidEP4cHDg=
=wF4b
-----END PGP SIGNATURE-----
