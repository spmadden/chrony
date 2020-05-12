-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.4.0
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
 0539c140365d8b99abc59397910793dcdebf5338 32352 chrony_3.5-3.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 87ef814f5e06cea48c0269a4b4d819aef72d8dad7d96bccabd8966d85ff36b94 32352 chrony_3.5-3.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 c7fc2aea31857031ca90ce2de192d405 32352 chrony_3.5-3.debian.tar.xz
Dgit: 44bbfc3a761332e46724af409b7a6e584b4b02be debian archive/debian/3.5-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl1TCmUACgkQnFyZ6wW9
dQq9qwgAiFV7pk7suJioNnaK2zJuhDEwxeUQJ8geZBgMrJnqA+upRC+bf9Lsb6Ao
ctNTabi2F135kSpY2h+XstxB2I/PYEQp40zYayDrpR050rUGtww2+55AnQaDmlAv
J4fM0C/KPIwPX7I8AYbu7b2bV5fGIex59x2lf/+wkQZNlt+eqFZHHlhsYX7vqQOq
eUZ40g+QGmNJeFZs17OJYjJyr8iuohb16H7u7ovMzGR2qkwvodh4ReZAip37QFe4
n5Y6YL7TR9Cs8EyFcGdEgxuIu/UD8VidZ/fYFt4Gy3Yv05m9+60UDgkhmXQm3cw5
Gw0knKtvzDgCkKO7I0NFBTJcYoJ65g==
=isIw
-----END PGP SIGNATURE-----
