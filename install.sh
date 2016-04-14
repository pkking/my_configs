#!/bin/sh
if [ ! -z "`which rsync`" ];then
	rsync -art dotfiles/ ~/
else
	echo "please install rsync first"
fi
if [ ! -z "`which nvim`" ];then
	if [ -d ~/.config/nvim ];then
		mv ~/.config/nvim ~/.config/nvim`date +%Y%m%d`
	fi
	mkdir -p ~/.config
	cp -r nvim ~/.config/
elif [ ! -z "`which vim`" ];then
	[ -d ~/.vim ] && mv ~/.vim ~/.vim`date +%Y%m%d`
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc`date +%Y%m%d`
	cp -r nvim ~/.vim
	mv ~/.vim/init.vim ~/.vimrc
fi

