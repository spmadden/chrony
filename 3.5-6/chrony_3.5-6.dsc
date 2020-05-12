-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 064de66cbc43a6ea64ad269111b499e57adbb742 163 chrony_3.5.orig.tar.gz.asc
 952ad66816def2a30c4e17a07308292573653efd 35820 chrony_3.5-6.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 fbf12ea6c5866d62fc9d9af331752bc0c2b161f089ecca75e0640239d505f6ef 35820 chrony_3.5-6.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 b4511774726331bade917daabd24637b 35820 chrony_3.5-6.debian.tar.xz
Dgit: f5b1677f5aea806344a8c3a135afa9c24f35ea7b debian archive/debian/3.5-6 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl5pStoACgkQnFyZ6wW9
dQrcowgAnjhvlMHlxX/MfWjfEdGrnxAp4bKIV6dviA2UzWJdJ/l1Fi+Bu5Rhu7sJ
WaxGCTcztAnoT1sOxpiQD6uPEVLE6Sw7/T/keMGKTBBAupIuMWjvKMfQYvS4BAMh
jNNBv/maYxY1t+3qtjKI9Naq+Ug2yP6ZB6Z9T5eGvL6rMX8wV8obg0nyfyQAP859
nrwbssIdCaIH0441RiXv8TlvxiXgKw/thE+Zdtyi6GIM35O8NqO60uqve6g6tL63
y0uru9Ryn+watDvJ020ozvnvEirqrAo5KjHd4ytIFFr7cGrLd9I7/GXZvXLerXR3
x71yLRxccl+ubrp3+RiAdwuCqhYPlg==
=2nTI
-----END PGP SIGNATURE-----
