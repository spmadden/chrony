-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6ubuntu6
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
 9dc470307611db3374e1718de6e1725ddf687969 40524 chrony_3.5-6ubuntu6.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 6925c0a6b787144e5fe77bc3a223f0d8d1630904fa25ed7815a337b8fc6c6d6a 40524 chrony_3.5-6ubuntu6.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 2bebb1b615b6e2bc5452512209ef127a 40524 chrony_3.5-6ubuntu6.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl6dqvUACgkQuj4pM4KA
skI0qg/8DKPz4yReWlFMi5j3uWe8D+rxarP+LWhZRxkWCvUWGvbu3BiVYKhjh4AI
kzGuiE/3KVhlD6tffDSIGWmVtJ6nr/YwN8AyuIRcurWeWdxxZnLG80A7GG7Owyqu
yAkvQgbTEewCGPDGSySuohw+mvxFrLLvfk38oQDDi5955ZTeqBPKVGXTVhLD5r/C
G7VMKeu030k928v3Tsw6m0DI7eur9pndF1MfLFTtFEtQ7i0eh3xPC46UrUm6+U+O
ZGXqFm3m3Kl46PW5FFvVpAYXXmqRmArVxrfrRxr0mlSBGRGhRdcuZUDU71KCDLvK
jWSpwIEmK8WDKSX5vNo9bUtVFmqbNKXIeRy3NMW9LHAtCOFLxiRrddjfffx2d3lw
dVh75WeiFdtBmYt09GPl4r2TsFxAWdzr6xJKcrdPKw4oS1etd9EvOIQndCD+JMNM
KeN0bepJdseDVD7/+h9C+MYWzui1dFvOUheJtQ8OY9Zm0glh5eF+DFTjjRNjetrh
cIEopCXcosplSYDzBG2PzkgS+JdQmY36TG2sx5PsdsS2vFPRrSADiHSwgE6y0M1c
557oxZNd/KdLU3hIK7tD75oL1MaIOOC8JgB+tCYy98qTILklGZO7AVVGSqVpH6Un
OrR7IPidme1lRHOxJtpNfwteLPLZaR9eDt2dCUXGD48PvsxEB2E=
=/RQD
-----END PGP SIGNATURE-----
