#!/bin/sh

# forking: see https://gist.github.com/Chaser324/ce0505fbed06b947d962
# git clone git@github.com:ssgromov/mc.git
# git config --local user.email "10381613+ssgromov@users.noreply.github.com"
# git remote add upstream https://github.com/MidnightCommander/mc.git
# git remote -v
# git fetch upstream

# packages for OSL
 #sudo zypper in check-devel automake autoconf autoconf-archive
 #sudo zypper in glib2-devel libext2fs-devel

  tool=mc
  ver=`git describe --abbrev=0`
 #ver=`git describe --always`

  echo -n "tool/version: ${tool}/${ver} | continue? (warning-with cleanup!) >"; read

  git clean -dfx # careful, removes untracked files!
  echo -n "cleanup done | continue? >"; read

./autogen.sh

./configure \
  --prefix=/soft/${tool}/${ver} \
  --disable-doxygen-doc \
  --without-x \
  --with-gpm-mouse \
  --enable-vfs-cpio \
  --enable-vfs-fish \
  --enable-vfs-sfs \
  --enable-vfs-smb \
  --enable-vfs-extfs \
  --enable-vfs-ftp \
  --enable-vfs-sftp \
  --enable-vfs-tar \
  |& tee config.out
