-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.4~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 08808dd3e16c9484903ffdda2680c5368eec91d8 608191 chrony_4.4~pre1.orig.tar.gz
 0373ee31a06bc123768aae7a567504dfa0652597 40560 chrony_4.4~pre1-1.debian.tar.xz
Checksums-Sha256:
 f241fb67c535c148db445abe055be3aac0d01c34bd93498ed8cfda3f0fc49b0f 608191 chrony_4.4~pre1.orig.tar.gz
 80a8359c0c08b1eba4f521f603d17b2dd90ff4904b47ab073655760075b0997f 40560 chrony_4.4~pre1-1.debian.tar.xz
Files:
 582bf059b635e23147df21c59c3ca9fa 608191 chrony_4.4~pre1.orig.tar.gz
 8441b4f5d540b202c7542a452110eff4 40560 chrony_4.4~pre1-1.debian.tar.xz
Dgit: 65db340406364e303d60b996f50a2b8a81b158c9 debian archive/debian/4.4_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmRfI/4ACgkQnFyZ6wW9
dQp1qQf9FOLwVCtVyfHmzOIWKKgKyV/fOyHG3abjmBbMV/z3Aw1+40z9kw14Xl7U
kcr39u5m/5VCRXiSDH2TrQi6dJwNWrl8sq+D35QvZ3ED4Byq4aIHbhAu0G+eCDie
LQ4b4KniwWobqBPbDYANbyrIn0FiGE1mjjVVk+8PKMCPrgr20vi8IbFqACK5V6eb
dlO1QtAYupv3Jb7lIz/OzZyQ/YuRK89aKV3uYf6uYwYITv3HGk7mqurL32jlDyMW
XnJPqDQ5qWvK6N5yidjo+BcgKJROP0qEfp7Y2so5JL4Qggjmv3Aywb95o8uYWWMd
2ZZOJFRwpXvdN36Ck2m3gYsK+/B8aA==
=bJdx
-----END PGP SIGNATURE-----
