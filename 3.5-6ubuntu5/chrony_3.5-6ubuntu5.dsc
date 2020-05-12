-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6ubuntu5
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
 fb879a0f944a07ab5b1890ec5c9eb12783fcab28 40512 chrony_3.5-6ubuntu5.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 9ae943a1374302cf5b672dca615cc4a02ade1134579723100bc2f8d5df106d3f 40512 chrony_3.5-6ubuntu5.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 c8ccd4cf6903a2b352d09b4ad8b0989a 40512 chrony_3.5-6ubuntu5.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl6XNV4ACgkQuj4pM4KA
skLK8w/+N3BwHmZsGvjsV2mZX/5S0HL7n8+xp47SKEf5mb0RtikgjjXPPsuQScAw
MibTbk7JJ1Tkx4l7lncpQ5MuXOFa0CjG/9hlKYaTS4QupYaUvfGwRb7BtfNK+CcU
z1IjSvi7AWJ2Grn0PeR5ZmE3B66o0i3/9qXIGaN1i44Y0Z89YZpX4/8MXncP51uJ
Qzrv0e+JehZQRTsx3auX99Vc81tQtDznXW6LpyWWhulL/ny/Vrd8NVPpyye6hafk
dyme3IO9fX3MqWERDhEj2vxE12lpPOQAXRWgfxdPohDnszF+Apby8+8dRI+/pFA9
79rzAnearY+ofz9NeXw5YCMKq1Ku2Gi5hfgqKg4z+dIY1n4wLhlHEVF+x4jUZPhS
NCNcJbStId7wCL8t5ORhhbiJfYF8Mf1W2w+dpAsAlK1l8yP6dX8xEPq2Xo1G+oWw
65rAUx78T17kocMC3PJmzQl6c7awXf3k2H7PhuJARVpPESB/ImtvV4XqLfpHJlY6
rnAzNv0LvDHvpyELTQ8YjQneTjIHYR2b4g8kxETthvRr6cxWCI6G4/k4vQ82GB8g
kka/RGEuzVhFZfHcMQpy8qIygpc7+14YTK18JoLlZpxj8f9to2w/2xscXwSpdzou
hMOH4NVgGKkDssrAR6RWf1/kxzOuE/HkS6l8juXWDhCvUHTMYsM=
=4GSG
-----END PGP SIGNATURE-----
