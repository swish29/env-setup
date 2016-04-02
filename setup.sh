#!/bin/bash
WORK_DIR=`pwd`

if [ "$1" = "cleanup" ]; then
rm -rf $WORK_DIR/repos/
fi

mkdir $WORK_DIR/repos/
cd $WORK_DIR/repos/

git clone https://github.com/tmux/tmux.git
git clone https://github.com/vim/vim.git
git clone https://github.com/zsh-users/zsh.git
git clone https://github.com/powerline/powerline.git
git clone git://repo.or.cz/stgit.git

# VIM
cd $WORK_DIR/repos/vim/
./configure
make -j 48
sudo make install

# TMUX
cd $WORK_DIR/repos/tmux/
./autogen.sh
./configure
make -j 48
sudo make install

# ZSH
cd $WORK_DIR/repos/zsh/
./Util/preconfig
./configure
make -j 48
sudo make install.bin
sudo make install.modules
sudo make install.fns

# Powerline
cd $WORK_DIR/repos/powerline
pip install --upgrade pip
pip install --user --editable=`pwd`
sudo ln -s `pwd`/scripts/powerline /usr/bin

# STGIT
cd $WORK_DIR/repos/stgit/
make -j 48
sudo make install
