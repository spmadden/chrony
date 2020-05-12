-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.4~pre1-1
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
 ceeff77ec4d61bdbbed46fc111f5b45caf245488 32060 chrony_3.4~pre1-1.debian.tar.xz
Checksums-Sha256:
 d1a55cc744b07ad06169d32544b3b818de3ab3103f58c29549e6a019218f2f3a 448957 chrony_3.4~pre1.orig.tar.gz
 157cf1479693e8ca875de0800897e897dba9513c4318259b0d503a2287c7676f 163 chrony_3.4~pre1.orig.tar.gz.asc
 27da4ddc56cabb494855b7cb24f2208d0df7f506d51810017134af21a6c39f59 32060 chrony_3.4~pre1-1.debian.tar.xz
Files:
 8951ba9e034a03427735a7518d362f99 448957 chrony_3.4~pre1.orig.tar.gz
 904a1694f05aed02f338ee75ec894b3e 163 chrony_3.4~pre1.orig.tar.gz.asc
 cd28c55d29cd0f49d84ec57631c03b22 32060 chrony_3.4~pre1-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAluNkBUACgkQnFyZ6wW9
dQpcswgAo/KmVLBCTwhebLMRtWmKy96NuCNd+a7YLGu/NKyksUVLM3DWGjds5e8N
wLUiG3gIhzwRgEQcz9yEAbY/VyqbSdapSLeTfP3WK8QPEMNrMI2G8hBSkguU5b/k
egcYlzdVLUeUJpce+5PG52Lx8+qctv18POmmzXBxFU4Hhr8Xz3cU5bYhXHnBaxLP
hny2XAHTc5wcznIvSz1Qnz/guGQZcrJcC5iEdCtoPeA9EoD5USjgDj6UuCAmXIu4
3yqkF39G+gAQuu99BvNjSmDiJ/g/lE2K+WT5pacTshW6fi8fJuCiE/oaKXcXtO62
sfEPHFhUvZi4GmZ5onlXWkGbhwGTfw==
=Kk/s
-----END PGP SIGNATURE-----
