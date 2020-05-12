-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.4~pre1-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.2.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper (>= 11), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any]
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 37c6d06bfdabd478c289f71f51df8076911836f2 448957 chrony_3.4~pre1.orig.tar.gz
 15e5238d18751472c0eb6633d81e0bb073b74040 163 chrony_3.4~pre1.orig.tar.gz.asc
 0db60fa231a59f1ebcf03baf4b2da3277f423355 32504 chrony_3.4~pre1-2.debian.tar.xz
Checksums-Sha256:
 d1a55cc744b07ad06169d32544b3b818de3ab3103f58c29549e6a019218f2f3a 448957 chrony_3.4~pre1.orig.tar.gz
 157cf1479693e8ca875de0800897e897dba9513c4318259b0d503a2287c7676f 163 chrony_3.4~pre1.orig.tar.gz.asc
 b6cb481a3e6e2baebb62d9bad23f80e30a86d38cdeeb0b095bf92402dd824967 32504 chrony_3.4~pre1-2.debian.tar.xz
Files:
 8951ba9e034a03427735a7518d362f99 448957 chrony_3.4~pre1.orig.tar.gz
 904a1694f05aed02f338ee75ec894b3e 163 chrony_3.4~pre1.orig.tar.gz.asc
 0793051ac63bd18e0cf037a06349d299 32504 chrony_3.4~pre1-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAluWp5gACgkQnFyZ6wW9
dQrAYgf+Ly4CwVkVEYrngOgy0ZM6QVfr6lpnBnQH60W8C0hPB2yhsOHkqxcr54WM
vFDi9HFjgfXDH6x8UPotDojoV7jJODkAV6KWQPsUxGfDG5qZP5fSHsvGdDyu/Zsl
cvbXeVqvF3/0Z1N9083LlS/g0/ykg+PQVHauDu7p7QLU4qsf3Gvuij9sepJahS8x
al1xXtTLGobqPIrE+tJ+hUL4hI3LjuMM62PeKatxrTlrQBkzE+VpRT1GV9DsdaPf
qYxkvqRacQoO75SwbXAVoNHWZtURpoOBHaWT7UdbWSQbPVDB1yj+hLzWH66K0csi
b3PR8xfMN3wV2qvc5hhMndSg4xQZ/g==
=5AC+
-----END PGP SIGNATURE-----
