#!/bin/bash

set -euxo pipefail
if [[ -z "$CHRONYBRANCH" ]] ; do
	echo "usage: $0 <chrony_branch_id>"
	exit 1;
done

GITHOST=https://github.com/spmadden/chrony
SIGNKEY=0x..

apt update
apt install git

git worktree add ../ubuntu-chrony ubuntu/applied/debian/bookworm
pushd ../ubuntu-chrony

export DEB_SIGN_KEYID=$SIGNKEY
export DEB_TARGET=x86_64
dpkg-buildpackage 
popd
