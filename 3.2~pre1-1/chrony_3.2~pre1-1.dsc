-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2~pre1-1
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
 7c58a02ae12bcb79c02317f21ba2b109c510d04b 431211 chrony_3.2~pre1.orig.tar.gz
 8caa238c519bc1ce4cf95da2fff8e49b838671c1 26840 chrony_3.2~pre1-1.debian.tar.xz
Checksums-Sha256:
 3c6fa2fe71ba670955498dcecab6a57c0b4ed8bc5a761629e96cd6038946942f 431211 chrony_3.2~pre1.orig.tar.gz
 91e3ba7b227341f1d546d402f8a9723878770c99be5a11dda531def9d04cbce1 26840 chrony_3.2~pre1-1.debian.tar.xz
Files:
 58f8b1b439f5d1a8084a2668b8284b25 431211 chrony_3.2~pre1.orig.tar.gz
 d30b8043850bcd2cabbbf03cacd30bb0 26840 chrony_3.2~pre1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAll4YrwACgkQnFyZ6wW9
dQriogf/auD8QPy0jCHIiwebDK/jQhOKQPXwDJ3gHrgzcHflz1xd3G5BcjH54apt
QDZJpLUyZGzwDB1dgqTuDKbrO2M8kVyNDfytiMcuvP2iOvPcZU9ITWiRwe0y/2qu
dB3ttkDTYvo0t6CH4ia1fkZQm/PjHOTMg3MO13EtmvOE+vtXHsvqZrwJdtp+ROsr
kWc3uOJDKmxMINcv/3I0QkM5CGf1JhX236d/WrdwuzLIkr3CYK8BWlwrZAvz+qUG
Ne/dh3pWJbH02lECtRufBXJvjA91EDirz3pW3HYZRpVyAofnn9i40Kmf+PwzAIHd
zMlzM9bnFQtyuIik07H48bGXbPkpcA==
=PrK/
-----END PGP SIGNATURE-----
