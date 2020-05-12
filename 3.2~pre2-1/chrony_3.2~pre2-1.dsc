-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2~pre2-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/collab-maint/chrony.git
Vcs-Git: https://anonscm.debian.org/git/collab-maint/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 10), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~)
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 7a726cc227f04780b518d053cbf949ca48897a75 430223 chrony_3.2~pre2.orig.tar.gz
 7637e1984ac7117d90b888a768a474ea54753781 163 chrony_3.2~pre2.orig.tar.gz.asc
 1f5ee63611f54b487fbcae23473f65732a0ddd0f 26868 chrony_3.2~pre2-1.debian.tar.xz
Checksums-Sha256:
 5db21408fcbeb75b9cea23b3c7482b64722d9760c9eb833d3d32ad8e063f5904 430223 chrony_3.2~pre2.orig.tar.gz
 08f70f5f9d44d699c800554e52e4b741ffe94575c8b0ecdf7bcbf586e3fca8b6 163 chrony_3.2~pre2.orig.tar.gz.asc
 6412d384e4afce5920569966e87a879012522a6fe2e54b326d40b2612a278851 26868 chrony_3.2~pre2-1.debian.tar.xz
Files:
 a9299c235e6be5168ba0155cd66bddfc 430223 chrony_3.2~pre2.orig.tar.gz
 1a75682ae6d2518c1b5febe5314dc50e 163 chrony_3.2~pre2.orig.tar.gz.asc
 e125a8eed5e416ab6c44b10c52e6f94a 26868 chrony_3.2~pre2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlmoQHoACgkQnFyZ6wW9
dQpZiAf+K81rMNGeZcKBfUf40DytuBgdM3pxYWhSV7OpV/d7qAfbYt93UMfz8mKf
fyULoHI4m7qE2fvl6Muh+Fe5ACVDk0CrOKwMBCrKCqYzTT2XqtkXU8XR0G9MTNZO
T5WPSPOSXycMBX/QIxP9VifbRIFmNrdXrK6XLgfTDRt+Ziw1rEmRzmb0mugupA/j
bqT66x2DIikIcdzUW5cMO9itCJYeX4ZudxHd/0ur4XzcdGxr+ZRRltARoua+JZCr
5GnO15NrJK5WZ6QA6c5c2AWPI+9Za7Leb+Q1hWdWmwJ1tkl323BpcdfGOZQMIc6r
zwHHpWHGZWo0Qy0TYHUuxamDtXg+qg==
=QutT
-----END PGP SIGNATURE-----
