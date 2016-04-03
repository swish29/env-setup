#!/bin/bash
set -e

WORK_DIR=`pwd`

if [ "$1" = "cleanup" ]; then
rm -rf $WORK_DIR/repos/
rm -rf ~/.tmux/plugins/tpm
fi

mkdir $WORK_DIR/repos/
cd $WORK_DIR/repos/

git clone https://github.com/vim/vim.git
git clone https://github.com/tmux/tmux.git
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/zsh-users/zsh.git
git clone https://github.com/powerline/powerline.git
git clone git://repo.or.cz/stgit.git

# VIM
cd $WORK_DIR/repos/vim/
./configure --enable-pythoninterp
make -j 48
sudo make install
cp $WORK_DIR/dotfiles/.vimrc ~/.vimrc
sudo ln -sf /usr/local/bin/vim /usr/local/bin/vi

# TMUX
cd $WORK_DIR/repos/tmux/
./autogen.sh
./configure
make -j 48
sudo make install
cp $WORK_DIR/dotfiles/.tmux.conf ~/.tmux.conf

# ZSH
cd $WORK_DIR/repos/zsh/
./Util/preconfig
./configure
make -j 48
sudo make install.bin
sudo make install.modules
sudo make install.fns
cp $WORK_DIR/dotfiles/.zshrc ~/.zshrc

# Powerline
cd $WORK_DIR/repos/powerline
pip install --upgrade pip
pip install --user --editable=`pwd`
sudo ln -sf `pwd`/scripts/powerline /usr/local/bin
sudo ln -sf `pwd`/scripts/powerline-config /usr/local/bin
sudo ln -sf `pwd`/scripts/powerline-daemon /usr/local/bin

# STGIT
cd $WORK_DIR/repos/stgit/
make -j 48
sudo make install
