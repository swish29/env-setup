#!/bin/bash
WORK_DIR=`pwd`

if [ "$1" = "cleanup" ]; then
rm -rf $WORK_DIR/repos/
fi

mkdir $WORK_DIR/repos/
cd $WORK_DIR/repos/

git clone https://github.com/vim/vim.git
git clone https://github.com/tmux/tmux.git
git clone https://github.com/zsh-users/zsh.git
git clone https://github.com/powerline/powerline.git
git clone git://repo.or.cz/stgit.git

# VIM
cd $WORK_DIR/repos/vim/
./configure --enable-pythoninterp
make -j 48
make install
cp $WORK_DIR/dotfiles/.vimrc ~/.vimrc

# TMUX
cd $WORK_DIR/repos/tmux/
./autogen.sh
./configure
make -j 48
make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp $WORK_DIR/dotfiles/.tmux.conf ~/.tmux.conf

# ZSH
cd $WORK_DIR/repos/zsh/
./Util/preconfig
./configure
make -j 48
make install.bin
make install.modules
make install.fns
cp $WORK_DIR/dotfiles/.zshrc ~/.zshrc

# Powerline
cd $WORK_DIR/repos/powerline
pip install --upgrade pip
pip install --user --editable=`pwd`
ln -s `pwd`/scripts/powerline /usr/local/bin
ln -s `pwd`/scripts/powerline-config /usr/local/bin
ln -s `pwd`/scripts/powerline-daemon /usr/local/bin

# STGIT
cd $WORK_DIR/repos/stgit/
make -j 48
make install
