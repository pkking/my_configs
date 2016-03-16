#!/bin/sh
if [ ! -z "`which nvim`" ];then
	mv ~/.config/nvim ~/.config/nvim`date +%Y%m%d`
	cp -r nvim ~/.config/
else
	mv ~/.vim ~/.vim`date +%Y%m%d`
	cp -r nvim ~/.vim
fi
