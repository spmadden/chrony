-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 11), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 ba1863397b701d56f86d929c09c6054837a16cd6 163 chrony_3.2.orig.tar.gz.asc
 69a10c5deddb2658b61bb22d07e6093aaa254809 27876 chrony_3.2-2.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4434f5f6eca4781ac906e260db2444f9ce08df4406621e0c0b58818b5a78cb9c 163 chrony_3.2.orig.tar.gz.asc
 6a8f7ce4dd7f80dddee402d3a30bcc27d3bfe309af059ab3abb339cd549db3c3 27876 chrony_3.2-2.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 1cfedd4f4838de9b8c4bb8a7990d6750 163 chrony_3.2.orig.tar.gz.asc
 10592346cdfe9ddaab08a0ddaa3ae9e8 27876 chrony_3.2-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlpuNnAACgkQnFyZ6wW9
dQqOugf6Ahm/ESq5f6JcW/hkFCFvPALxxb5LAnOZeI4RVmhcdqRVP9tofsMHMkWk
fa/ta1hDdV33vDfVKs8DFbBm9G6HODdkcLVR6GhpXG7IURzdJur0qyMl+vmOy3M6
QnKRuHgKwMq4FgNK0OLBItP9Af9WqSAu/cDz17sdhwX5TAxDR3w5GxhHHapZ4+8Z
dAeu9C3kwW7dODSsgaksoSLzcjgpvFWo4NPaKCiGGyIfBwduuKU2GVT1lx5O/7fE
BDXyiN5pymtus4ZrSjXh1Itiu96EZqDiRvuwT2sFAVjebINmFFYy5a4oQWMOUhhj
Qz+ipfwmmzq96Q/hMvO6jajLoodrNg==
=Oeh2
-----END PGP SIGNATURE-----
