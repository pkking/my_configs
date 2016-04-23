#!/bin/sh
timenow=`date +%Y%m%d`
mkdir -p ~/.config
if [ -d ~/.config/nvim ];then
	mv ~/.config/nvim ~/.config/nvim$timenow
elif [ -L ~/.config/nvim ];then
	rm ~/.config/nvim
fi
ln -s "`pwd`"/nvim ~/.config/nvim

dotfiles="`ls dotfiles/`"
for f in $dotfiles;do
	if [ -f ~/.$f ];then
		mv ~/.$f ~/.${f}$timenow
	elif [ -L ~/.$f ];then
		rm ~/.$f
	fi
	ln -s "`pwd`"/dotfiles/$f ~/.$f
done
if [ -f ~/.vimrc ];then
	mv ~/.vimrc ~/.vimrc$timenow
elif [ -L ~/.vimrc ];then
	rm ~/.vimrc
fi
ln -s "`pwd`"/nvim/init.vim ~/.vimrc
if [ -d ~/.vim ];then
	mv ~/.vim ~/.vim$timenow
elif [ -L ~/.vim ];then
	rm ~/.vim
fi
ln -s "`pwd`"/nvim ~/.vim
if [ -d ~/.config/awesome ];then
	mv ~/.config/awesome ~/.config/awesome$timenow
elif [ -L ~/.config/awesome ];then
	rm ~/.config/awesome
fi
ln -s "`pwd`"/awesome ~/.config/awesome
if [ -d ~/.oh-my-zsh ];then
	mv ~/.oh-my-zsh ~/.oh-my-zsh$timenow
elif [ -L ~/.oh-my-zsh ];then
	rm ~/.oh-my-zsh
fi
ln -s "`pwd`"/oh-my-zsh ~/.oh-my-zsh
