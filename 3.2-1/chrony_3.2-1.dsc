-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-1
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
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 ba1863397b701d56f86d929c09c6054837a16cd6 163 chrony_3.2.orig.tar.gz.asc
 ab51d2879fe368deee20a35b7d4edbc325630ba2 26880 chrony_3.2-1.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4434f5f6eca4781ac906e260db2444f9ce08df4406621e0c0b58818b5a78cb9c 163 chrony_3.2.orig.tar.gz.asc
 048b9bb61a2da30ee21d5e12762a94724409a01c85a516377bbb23d51d032998 26880 chrony_3.2-1.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 1cfedd4f4838de9b8c4bb8a7990d6750 163 chrony_3.2.orig.tar.gz.asc
 43fa34cc9da9d1b10d8f60210f5ba90f 26880 chrony_3.2-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlm70pcACgkQnFyZ6wW9
dQqxFQf8D4LXM2CFcH1iIHfaeIYIwEPVAGiaxEW06tBKkpcUFYBF95Uedgad3QpJ
rW6I9dI/Xg4vG6utSdLmFKvGAnKKklEl1Tlm+OoMgRinRFOV3HkaYCB8WBM7EEqO
hOva6HrysgdGWX3BPsmyndMjtjc746Ki/tj9Nz1RHdJXMD/ujDtmZE61pPpGyxWg
7wefKf0sebAIeXqIZmmWMKf027tm3YBFtqUDywW5MyfGVnuL9NDzEQ0dXBsWuqBk
quSKUykkAAwHVBz3ukosGzKeicX4e1GpQ8aLEVNpkQuRIW8pBuMSNXPQ0QO+DviM
4IbrBWn59iZwUgtDKwd8jTgdDa8sWg==
=0+Qj
-----END PGP SIGNATURE-----
