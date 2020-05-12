-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.1-4
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
 b13f44249165b3ba896802be1e2f279c117ae8d2 27064 chrony_3.1-4.debian.tar.xz
Checksums-Sha256:
 9d9107dcdb7768a03dc129d33b2a7a25f1eea2f5620bc85eb00cfea07c1b6075 424109 chrony_3.1.orig.tar.gz
 e42fed80b0233d1347d7aed9e8bfd9710ede12f3bf35307dabd1631994e0f487 27064 chrony_3.1-4.debian.tar.xz
Files:
 f8d2ee78c55548bfbe95582c6a855cee 424109 chrony_3.1.orig.tar.gz
 8d249ae4a9db99f3cb481c0e3d2997f3 27064 chrony_3.1-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAllIK2kACgkQnFyZ6wW9
dQqxoAf+Ku3gQgeZBbi4eHu9RaUsQJwGk3q+WHy/hhLb1f3GyM3PtelX58+XA0pP
3uhv9mjojgPl6DNQLcuvRx9VR9Csv09FPhuVKuOmQmmGL5n8g+KM0ZsOqcD85iBP
bHciNlzW1QI/IrrO9iD0nFK4DdP4RRPKIYKwMyItdwiH4Tv+EHPGT8XG74guhAh3
xbzeyvdZCXe2swdjPs5Shr4ZPf/6XTL7tKDdD1RENzjFsgDdu+Lrr4NZN2gOKLHl
PvMYYUEMltSFl2rC97sITydaPEfBu+j6F7YgQdNb8HgQO3gVce0IQgJVMQzb92Ut
CjyisyHC4wvZImlQCHQ6wACq8EUMHw==
=PNkB
-----END PGP SIGNATURE-----
