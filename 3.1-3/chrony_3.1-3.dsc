-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.1-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 3.9.8
Vcs-Browser: https://anonscm.debian.org/cgit/collab-maint/chrony.git
Vcs-Git: https://anonscm.debian.org/git/collab-maint/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 10), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~)
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 564dd010a10fbdcc7c177337115ccffa43fe0f95 424109 chrony_3.1.orig.tar.gz
 6dd3479dc52b2353c0a72860f067daacae3c079d 27028 chrony_3.1-3.debian.tar.xz
Checksums-Sha256:
 9d9107dcdb7768a03dc129d33b2a7a25f1eea2f5620bc85eb00cfea07c1b6075 424109 chrony_3.1.orig.tar.gz
 5a625b90719f669f76c10d624eb82ae5906e0a0e3c1c498002a5b9793e96234d 27028 chrony_3.1-3.debian.tar.xz
Files:
 f8d2ee78c55548bfbe95582c6a855cee 424109 chrony_3.1.orig.tar.gz
 c8a6642db59b41da6ff6b5527f97bbfc 27028 chrony_3.1-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlkYorAACgkQnFyZ6wW9
dQomnAgAqz54fEXqTsTnmZFHjQu4Bm4lwYm6XMGapSHQ1XkRMDG8W1LAcnuL0UZr
eIIoADfhHmb+eho3A3KO97TQ/3Qt9DvMoCl37PWlVYruqndVp0+j3Ux/Xe1fJdvj
iyVCdZW7BRs43planI61YJiMJ9pj9TbTxUvL4h4s+3KP18BkzV7Z1TVwza/4w6bs
pJkmUUn54j3xlcbyR5scomUi7QAwN8zI0Z/o2HrBOqdLngrZBP3WFJRhmqbmUc+q
i6/Ql/GnNn35EM0fG/cSwumk1LWK6vJKNpPH2omY5Xxt6JhCO42si+zaemPLbf5k
sIXZekxFFWiqbw9VMqI4sjlnL2MpCw==
=+5IU
-----END PGP SIGNATURE-----
