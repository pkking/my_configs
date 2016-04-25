#!/bin/sh
# first clone all the submodules
git submodule init && git submodule update
if [ $? -ne ];then
	echo "fail to update all the git submodule"
	exit 1
fi
timenow="`date +%Y%m%d%H%M%S`"
mkdir -p ~/.config
if [ -d ~/.config/nvim ] && [ -L ~/.config/nvim ]
then
	rm ~/.config/nvim
else
	mv ~/.config/nvim ~/.config/nvim$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim ~/.config/nvim
echo -n "install neovim conf files "
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

dotfiles="`ls dotfiles/`"
for f in $dotfiles;do
	if [ -f ~/.$f ] && [ -L ~/.$f ];then
		rm ~/.$f
	else
		mv ~/.$f ~/.${f}$timenow > /dev/null 2>&1
	fi
	ln -s "`pwd`"/dotfiles/$f ~/.$f
	echo -n "install $f conf files "
	if [ $? -eq 0 ];then
		echo "successfully"
	else
		echo "failed"
	fi

done
if [ -f ~/.vimrc ] && [ -L ~/.vimrc ];then
	rm ~/.vimrc
else
	mv ~/.vimrc ~/.vimrc$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim/init.vim ~/.vimrc
echo -n "install vimrc conf files "
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -d ~/.vim ] && [ -L ~/.vim ];then
	rm ~/.vim
else 
	mv ~/.vim ~/.vim$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim ~/.vim
echo -n "install .vim conf files "
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -d ~/.config/awesome ] && [ -L ~/.config/awesome ];then
	rm ~/.config/awesome
else
	mv ~/.config/awesome ~/.config/awesome$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/awesome ~/.config/awesome
echo -n "install awesome conf files "
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -d ~/.oh-my-zsh ] && [ -L ~/.oh-my-zsh ];then
	rm ~/.oh-my-zsh
else
	mv ~/.oh-my-zsh ~/.oh-my-zsh$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/oh-my-zsh ~/.oh-my-zsh
echo -n "install oh-my-zsh conf files "
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -d ~/.powerline ] && [ -L ~/.powerline ];then
	rm ~/.powerline
else
	mv ~/.powerline ~/.powerline$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/powerline ~/.powerline
# install for user
pip install --user --editable=powerline > /dev/null 2>&1
echo -n "install powerline conf files "
if [ $? -eq 0 ];then
	echo "successfully, please run source ~/.zshrc in zsh or relogin zsh"
else
	echo "failed"
fi

