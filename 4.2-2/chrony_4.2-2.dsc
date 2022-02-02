-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 0f5de043b395311a58bcf4be9800f7118afd5f59 578411 chrony_4.2.orig.tar.gz
 9934ca9021c369c174b4eeeecf162a9d2078c4f0 833 chrony_4.2.orig.tar.gz.asc
 d2c1336081e331c0448b44d3ac372df908cf2189 40352 chrony_4.2-2.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 ea6eba0197ad9f1dbdcb283662cdb3be3997a2c8fdba93ee95b9c4b09570e73c 833 chrony_4.2.orig.tar.gz.asc
 a7ceeedc84a9d0fb0e48168dc3b29faf73f9babb5e3490b9cb879a14b98cf397 40352 chrony_4.2-2.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 af3e056ab8999a52246f684c929701a9 833 chrony_4.2.orig.tar.gz.asc
 b509f75a3a5362beb1d1990e51fbbf4f 40352 chrony_4.2-2.debian.tar.xz
Dgit: 2719963697018591a19a40141126de4258e0a82e debian archive/debian/4.2-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmH6x5oACgkQnFyZ6wW9
dQplXQf/fzVXuKDQh70u3fbsBdd5Gv6WKVAa/as/AqNR3XIYvCyglWMurr0pGyHc
gSAHHjSh0D28EyNp1Nokf/twsZp9bJS+LrTQ9xLb22GbDlBMHIMRHewZ6cDQGRL0
r2tacXoOam8for3emXds10+pQw4T76UuVWsV+Huok8mAkrrKlB05C/ciaGOOiocK
HXmiRKMXCSKJep740ywZ1B/Vlav6YdKr9BcriLCuK1IceHoOoFl6izRXaeBH94uC
fMPy7Q78qUJQn/ri9nzb5KoMQX9KoLR04TUpKMXUNQ0FT86rNjSn4/0AKpjzSGL9
Y/SUETuPXS+eYPM/xPGBy3znz4jZOg==
=pKym
-----END PGP SIGNATURE-----
