-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-2ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 6aad0c27bcd23471e7bf8e1573180817a56b278b 46380 chrony_4.3-2ubuntu1.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 961d4a13c6af802b60ec07d43f10cd25b94a7d6877dfa502893a7529329096e0 46380 chrony_4.3-2ubuntu1.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 29bac72df71440c68962832118928e1a 46380 chrony_4.3-2ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpmEQCz2sHU8srYpU5gOyV4+48PsFAmRmtD0ACgkQ5gOyV4+4
8PviMxAAq7H80N0ePDeqgsRHG9LbEGZQG7B79vX0BDLujKHL546pvi5+J2oqV8H9
+Asmh13cW+ua+2dpyksTM5f6LCx/iz96ovNKfg2phJ22CsPNtAubUEppBtDTkV5/
x8HKP5gWEnwan27FxTTRGH3ntCyGh5qIGl95Pjx27khALf4+OJCYJEmKQ1bR3U08
ElXdEBRXdC1WV4dIbrfKiFnASe8qcqW00A+kMhsd0/hR/V6QjL23LXR+eFmYW1Sg
kK+fvae+UcWNarwe3PaaTAc0Z7broI1fHgZIC0PaX4Lrzg+hYD7fYNlihQzsKN8m
jfmEuyR0j4d6ovl554hfpAJ2qfazqJ+1loYCoY3y2ePJQNqqetXfaAr0XHmhNpRP
jA50yF424d7rpRygUCLCBA+Mj2nK2xgO46rf6e0JqCUHopcxfzTQQR0H8m+0jOlV
IpuItZYMhmv2XjkqzJ7K4XWRuxG/XjbHV3ZH0HRk69vQM8vL+JcKCKz9fJa8DtuR
OpC5f1EqbNqRxIGkdNj/0o6bT/xUf3Eb8jzcUolCGdycuiYI9QgW7dbwQd9IKBsk
YW+e8Cd/WT9tFnvEFSSsOAFxUEZduvoRNmNQmhX0ocjUMD+vUGd+lzV1UROVUT4B
bdN7EJL6RjnLP2v33oLFc/f6qxiJdegBZ04DP5z2Q+9gra3qtIM=
=UYhA
-----END PGP SIGNATURE-----
