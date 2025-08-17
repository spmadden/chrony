-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.7-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.5.5-2~) [amd64 arm64 armel armhf hppa i386 loong64 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 7a59427bb96df4b1d443cf6eb5bea9e95a6b071f 644610 chrony_4.7.orig.tar.gz
 3c19de582bfc9cf216ac359477cc58c8febaae7a 833 chrony_4.7.orig.tar.gz.asc
 7490c22874ad3bcf3ec0b0ce9ff7b4cab1983955 42896 chrony_4.7-3.debian.tar.xz
Checksums-Sha256:
 c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b 644610 chrony_4.7.orig.tar.gz
 ac3ca0847891d91551d53ba6adad257e0261bc6fc4f72175173bef3c6855411c 833 chrony_4.7.orig.tar.gz.asc
 b401c1ff019fcaa7b1f941d69b9fed5960768274aa615d06d05026139a6b1246 42896 chrony_4.7-3.debian.tar.xz
Files:
 a1ab6e972527a9cbf6bf862679352ed3 644610 chrony_4.7.orig.tar.gz
 c4fc703ea91ef6fe12fc892b29950821 833 chrony_4.7.orig.tar.gz.asc
 292475b89d5d4b0d1a0ce9aa9ead85a8 42896 chrony_4.7-3.debian.tar.xz
Dgit: ae5d14e30cb8454f545b3f2b493b1e5c436a1efa debian archive/debian/4.7-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEG5OTVaxMNcrfvXOcBqMo4AxqzhUFAmig7rQACgkQBqMo4Axq
zhUI3xAAt+ZC0bqOqFKFLrJlaXIwhaIphM90FFS9tTiNcsQfwqg74AeikDfIRuRm
yvsWZ2aQkrlbjtaL+AA/LvxC7OFq9KQZ7PS9hDt61UUIiv+D1TTIVLfU8Y6J1JTr
QtR714Pz8HB5fSMhjkeCBurE7Rfuyvywp/IuUeiuPE3L3Lh5YRevGzJEM9nNzTlY
6pebKUF9YT61Ggl3toLl1Pp4oppoG0jkT7QplmTpBZMLopKFoGXy85oBbdBdqSge
ojgOyUYtoXPRDWv1vbXZcMfL7s0yvPbj2PCt+n500JNZwp7mhf2TkYpo/aYJfqIG
C3FMH3XYt/xtuiQQCjff0nXsrJjzyse+qnO2ul9urKIEFfTbc6SCss6bjUcn7fY/
PrXe2nL7OuUr3IuvrVvcQtax9m8NKjsf0hmjUZtx2Qaj1yUQ/ALG1WMZUXGIxsaU
9zzDwNidXDcYxa7lmLhp1KajADNGMPg7IlSNVwHQkntCn16CzHcVG7Nd7uws55CD
9o343fFirpgFZh/QkXqoha7zP24A3ysmZ1qJz9D5EEh1y+Su9odHW/vYLAZriuIG
8rHTvle7HGgUcFMEebb+hVAxYNDBWw1XcDnfphSTjLS8I69T/Oq5ApHwce6dsNms
0LHRyWryyIrzslweYLBd0HwbBoxdI/7GXm50KSNdD+kvhJBF2MM=
=Q0N2
-----END PGP SIGNATURE-----
