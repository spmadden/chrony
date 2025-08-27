#!/bin/bash

set -euxo pipefail
#if [[ -z "$CHRONYBRANCH" ]] ; then
#	echo "usage: $0 <chrony_branch_id>"
#	exit 1;
#fi

GITHOST=https://github.com/spmadden/chrony
SIGNKEY=0xFAC723CAF3A36ED2

sudo apt update
sudo apt -y install \
	git \
	dpkg-dev \
	dpkg-cross \
	asciidoctor \
	bison \
	debhelper-compat \
	dh-apparmor \
	gnutls-bin \
	iproute2 \
	libcap-dev \
	libedit-dev \
	libgnutls28-dev \
	libseccomp-dev \
	nettle-dev \
	pkg-config \
	pps-tools
if [[ ! -e "chrony" ]]; then
	git clone $GITHOST
fi
cd chrony
if [[ ! -e "ubuntu-chrony" ]] ; then
	git worktree add ubuntu-chrony spm-4.7-3
fi
pushd ubuntu-chrony

export DEB_SIGN_KEYID=$SIGNKEY
export DEB_TARGET=x86_64
dpkg-buildpackage -nc
popd

#make repo
mkdir -p repo/pool/main
cp chrony_4.7-3_amd64.deb repo/pool/main/
mkdir -p repo/dists/stable/main/binary-amd64
dpkg-scanpackages --arch amd64 repo/pool > repo/dists/stable/main/binary-amd64/Packages

# make release file
pushd repo/dists/stable
bash ../../../make_release.sh > Release
popd
# sign release file
cat repo/dists/stable/Release | gpg -abs > repo/dists/stable/Release.gpg
# make InRelease file
cat repo/dists/stable/Release | gpg -abs --clearsign > repo/dists/stable/InRelease

