#!/bin/bash

dnf remove -y \
	vim \
	powerline \
	tmux \
	tmux-powerline \
	vim-powerline \
	vim-minimal \
	vim-enhanced \
	stgit

dnf clean all -y

dnf update -y

dnf install -y \
	git \
	make \
	automake \
	gcc \
	python-devel \
	python-pip \
	ncurses-devel \
	libevent-devel

dnf clean all -y
