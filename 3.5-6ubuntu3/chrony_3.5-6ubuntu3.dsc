-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-6ubuntu3
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
 8e8d231792bb3b7502298cfed18de913657f528e 40392 chrony_3.5-6ubuntu3.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 80f43585d18d8ac1a90250e13c2bc5df51328fd3aae1e018c003b4fd8b7017bb 40392 chrony_3.5-6ubuntu3.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 72fdf1c758bbfd4ee1c85109698f1e30 40392 chrony_3.5-6ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl6Ky6oACgkQuj4pM4KA
skJ3lw//XwJ81eHW2GDI+1eLzefXxH71rg6uiBiHlqbAdyw4NECJa1A2PZgXb+pI
6Ylqt4AdLDS5wo4VlKR1nGukBAS1yEv7NXPYjGatCwn/W09p+CqXA+SARhAOaTYZ
QIuXzf0lcEiRicTj5G46pivUbMeukrmtsv29A4aUisiDLUv1YTkk21tgMAIlpFJ1
hE5Z9VakXErCm5XgqG0x2MLpSNrJX5jTERKwQwLp2PqNF1Gn+1FoejX/AcMYEX84
paojuvBPTug43Ri0uG4H6s+hhqB3M3w0/qKHv+1p6TON1zeohPo9n9cOwDMii/Zd
6RDd+C2IGdoxlcxiG4xzAj5NpyjPXVLpXVgYLQfTw+3ea1Wn2JZCa7f0fSv4gfbU
O5mYFEbotI4pPCyoFP3Sj+3YaAQghO8Z7ouWEzgzRaE8V3KQuhRa90HTsb2H3X2x
IWtIORj7OkvSOCQpe3oxD+gEgq2soe+FgEq5bV3wodWB1DJwz9ll1NhdjvtQaw+I
wiwaQmBxRQicnTPerzGsuEh0C3EATbXCRzOhYeqWfG4yCTyMHOWbHStPIc07RanG
XtpGTENWiXV8ih89cDvoel+43Zt2P9gUTq0WlCJOIGnbWuaj3ChTTxthAFHHPC/P
UDpbi6uvSyfBv0JA2hO0NBULcm+oKUZEld4mzpysR6APqN8i3jc=
=QdM6
-----END PGP SIGNATURE-----
