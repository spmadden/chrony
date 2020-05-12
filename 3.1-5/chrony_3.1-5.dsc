-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.1-5
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.0.0
Vcs-Browser: https://anonscm.debian.org/cgit/collab-maint/chrony.git
Vcs-Git: https://anonscm.debian.org/git/collab-maint/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 10), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~)
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 564dd010a10fbdcc7c177337115ccffa43fe0f95 424109 chrony_3.1.orig.tar.gz
 4b18cfbc9076a7938814f67f1fc635a1e038a42b 27260 chrony_3.1-5.debian.tar.xz
Checksums-Sha256:
 9d9107dcdb7768a03dc129d33b2a7a25f1eea2f5620bc85eb00cfea07c1b6075 424109 chrony_3.1.orig.tar.gz
 28cf4be25dd924e01040e837dd55a8900be549b7825bccb77ed6af4b78c5d1b5 27260 chrony_3.1-5.debian.tar.xz
Files:
 f8d2ee78c55548bfbe95582c6a855cee 424109 chrony_3.1.orig.tar.gz
 40eba81a2341467fca227294c01fbfda 27260 chrony_3.1-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAllw6zQACgkQnFyZ6wW9
dQqShQf+OU2xixjNDx6YfW6HpdNgcSx81LhQwZbkQVbb18Pp+Eo60O325FGlxNd9
H1QSc/qkvcTgVYPDdKAVh1Xw9mYvFPVh6y6pMuV1Az96Hz2+DEhINtdxJsZmYLK4
lbpgFZC4oJUrFdajRLUJn5BhoXfq6rUyIC8IFuxWp1hnem4y1hxDTaPLTAfExW/K
BmGAMUSnXCkMd6u3OwiIoVoACwLk6wrp4mQuA1qaP4uztMYsHxpCV/nfGDFTF2we
iADnKOSvWtxmHPktVXLDS4tYKTepKgwv6CX70e7my+51jj6QKui8obrEGHrOTzDc
8XNadcksmsy8BZdaacT2lDRj0oN7qw==
=34eX
-----END PGP SIGNATURE-----
