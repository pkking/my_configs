#!/bin/sh
if [ ! -z "`which nvim`" ];then
	mv ~/.config/nvim ~/.config/nvim`date +%Y%m%d`
	cp -r nvim ~/.config/
elif [ ! -z "`which vim`" ];then
	[ -d ~/.vim ] && mv ~/.vim ~/.vim`date +%Y%m%d`
	[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc`date +%Y%m%d`
	cp -r nvim ~/.vim
	mv ~/.vim/init.vim ~/.vimrc
fi
