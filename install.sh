#!/bin/sh -e
# first clone all the submodules

install_deps() {
	local deps="i3 dmenu neovim python python-pip zsh --noconfirm feh"
	. /etc/os-release
	if [ ! -z "`echo $NAME|grep 'Arch Linux'`" ];then #for archlinux
		echo "you are using Arch Linux, please run with pacman
		-S $deps"
		return 0
	else
		echo "please install $deps manually"
		return 0
	fi
}
echo "start updating submodules"
git pull && git submodule init && git submodule update --remote 
if [ $? -ne 0 ];then
	echo "fail to update all the submodules"
	exit 1
fi
timenow="`date +%Y%m%d%H%M%S`"
install_deps
if [ $? -ne 0 ];then
	echo "install deps failed"
	exit 1
fi
mkdir -p ~/.config
if [ -d ~/.config/nvim ] && [ -L ~/.config/nvim ]
then
	rm ~/.config/nvim
else
	mv ~/.config/nvim ~/.config/nvim$timenow > /dev/null 2>&1
fi
echo -n "install neovim conf files "
ln -s "`pwd`"/nvim ~/.config/nvim
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
	echo -n "install $f conf files "
	ln -s "`pwd`"/dotfiles/$f ~/.$f
	if [ $? -eq 0 ];then
		echo "successfully"
	else
		echo "failed"
	fi

done
mkdir -p ~/.pip
[ -f ~/.pip/pip.conf ] && mv ~/.pip/pip.conf ~/.pip/pip.conf$timenow
[ -L ~/.pip/pip.conf ] && rm ~/.pip/pip.conf

ln -s ~/.pip/pip.conf dotfiles/pip.conf
if [ -f ~/.vimrc ] && [ -L ~/.vimrc ];then
	rm ~/.vimrc
else
	mv ~/.vimrc ~/.vimrc$timenow > /dev/null 2>&1
fi
echo -n "install vimrc conf files "
ln -s "`pwd`"/nvim/init.vim ~/.vimrc
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -z "`which pip 2>/dev/null`" ];then
	echo "install pip first"
else
        if [ -z "`pip show neovim 2>/dev/null`" ];then
		echo "we are going to install neovim with pip"
		sudo pip install neovim  > /dev/null 2>&1
	else
		echo "neovim already installed"
	fi
fi


if [ -d ~/.vim ] && [ -L ~/.vim ];then
	rm ~/.vim
else 
	mv ~/.vim ~/.vim$timenow > /dev/null 2>&1
fi
echo -n "install .vim conf files "
ln -s "`pwd`"/nvim ~/.vim
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
echo -n "install awesome conf files "
ln -s "`pwd`"/awesome ~/.config/awesome
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

if [ -d ~/.config/i3 ] && [ -L ~/.config/i3 ];then
	rm ~/.config/i3
else
	mv ~/.config/i3 ~/.config/i3$timenow > /dev/null 2>&1
fi

echo -n "install i3 conf files "
ln -s "`pwd`"/i3 ~/.config/i3
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

echo -n "install awesome conf files "

if [ -d ~/.oh-my-zsh ] && [ -L ~/.oh-my-zsh ];then
	rm ~/.oh-my-zsh
else
	mv ~/.oh-my-zsh ~/.oh-my-zsh$timenow > /dev/null 2>&1
fi
echo -n "install oh-my-zsh conf files "
ln -s "`pwd`"/oh-my-zsh ~/.oh-my-zsh
if [ $? -eq 0 ];then
	echo "successfully, please run source ~/.zshrc in zsh or relogin zsh"
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
echo "will install powerline, run pip install --user --editable=powerline and
pip install powerline-status manually for deps"
echo -n "install powerline conf files "
#pip install --user --editable=powerline > /dev/null 2>&1
#sudo pip install powerline-status > /dev/null 2>&1
if [ $? -eq 0 ];then
	echo "successfully"
else
	echo "failed"
fi

echo -n "install patched fonts "
fonts/install.sh > /dev/null 2>&1
if [ $? -ne 0 ];then
	echo "failed"
else
	echo "successfully"
fi

if [ -d ~/XX-Net ] && [ -L ~/XX-Net ];then
	rm ~/XX-Net
else
	mv ~/XX-Net ~/XX-Net$timenow > /dev/null 2>&1
fi
echo -n "install XX-Net "
ln -s "`pwd`"/XX-Net ~/XX-Net
if [ $? -eq 0 ];then
	echo "successfully, run ~/XX-Net/start to launch XX-Net"
else
	echo "failed"
fi
