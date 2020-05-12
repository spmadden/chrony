-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.4-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.3.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any]
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 fa41e595e7041a9deda76a69e970a023091474f6 453056 chrony_3.4.orig.tar.gz
 470ebf89640f8cafdccf7605e82d0b5147af8ee5 163 chrony_3.4.orig.tar.gz.asc
 6f6d75db5bae23d379e70cfd29b2076b53860142 30604 chrony_3.4-2.debian.tar.xz
Checksums-Sha256:
 af77e47c2610a7e55c8af5b89a8aeff52d9a867dd5983d848b52d374bc0e6b9f 453056 chrony_3.4.orig.tar.gz
 4c8fb3b296dcf9eb064bad50090adf054aba2dbf15cef16bcc379b9ffe624e67 163 chrony_3.4.orig.tar.gz.asc
 77a7f6832d2474de7ab9a9d934606ea81ef6fa924bbee6fef80913c2c69d3e90 30604 chrony_3.4-2.debian.tar.xz
Files:
 7170e750469c198fc6784047d6f71144 453056 chrony_3.4.orig.tar.gz
 407daf2474c7b08d7c7acb84bf60901a 163 chrony_3.4.orig.tar.gz.asc
 81ea6a99aac2e9f99d9aa53e88ec7ea1 30604 chrony_3.4-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlxkeKQACgkQnFyZ6wW9
dQoq0Af9GsKpOWfv+7Uo4qA8B2ycK+ce5N7f48WDylHweZF9rbJGkuIwyGVyvaJD
PTvEotwN6Oo+siBAtLRrJu2aC17MEVesEbZJVsjRnSNvrPdbtzx/BVK0LAaesths
j2FaPtqLvvq68B7Tnlw/hgpZK/d0//1WWKnzxGt88NexF6E0lvES6NBp5xRaWeFw
k9/8+vGA2uFds45YDPoHdD6GvksSaSVaXRTQt2IkeC2kwwpqGtHyOlJQOcHjyygo
MUjgasjYN1SyZ9hrLNCtEplWyPSPwDRb5MU2Y1wVAEOTEsKYlmwUy9I3m7BdezPW
HXakP+I++SxRGeGUzkpSLujvfZfC1w==
=NFfs
-----END PGP SIGNATURE-----
