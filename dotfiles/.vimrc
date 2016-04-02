set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=utf-8

syntax enable
set mouse=a

set rtp+=/root/env_setup/repos/powerline/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
