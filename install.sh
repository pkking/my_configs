#!/bin/bash
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

print_result() {
	name="$1"
	local res
	if [ $? -eq 0 ];then
		res="\e[92msuccessfully\e[0m"
	else
		res="\e[91mfailed\e[0m"
	fi
	printf "install %-30s %b\n" "$name" $res
}

timenow="`date +%Y%m%d%H%M%S`"
mkdir -p ~/.config
if  [ -L ~/.config/nvim ]
then
	rm ~/.config/nvim
elif [ -d ~/.config/nvim ]
then
	mv ~/.config/nvim ~/.config/nvim$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim ~/.config/nvim
print_result "neovim conf files"

dotfiles="`ls dotfiles/`"
for f in $dotfiles;do
	if [ -L ~/.$f ];then
		rm ~/.$f
	elif [ -f ~/.$f ];then
		mv ~/.$f ~/.${f}$timenow > /dev/null 2>&1
	fi
	ln -s "`pwd`"/dotfiles/$f ~/.$f
	print_result "$f files"
done
mkdir -p ~/.pip
[ -f ~/.pip/pip.conf ] && mv ~/.pip/pip.conf ~/.pip/pip.conf$timenow
[ -L ~/.pip/pip.conf ] && rm ~/.pip/pip.conf

ln -s "`pwd`"/dotfiles/pip.conf ~/.pip/pip.conf 
if [ -L ~/.vimrc ];then
	rm ~/.vimrc
elif [ -f ~/.vimrc ];then 
	mv ~/.vimrc ~/.vimrc$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim/init.vim ~/.vimrc
print_result "vim conf files"

if [ -z "`which pip 2>/dev/null`" ];then
	echo "install pip first"
	exit 1
elif [ -z "`pip show neovim 2>/dev/null`" ];then
	pip install --user neovim -q
	print_result "neovim python bindings"
fi


if [ -d ~/.vim ] && [ -L ~/.vim ];then
	rm ~/.vim
else 
	mv ~/.vim ~/.vim$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/nvim ~/.vim
print_result "vim plugins conf files"

if [ ! -z "$(which vim 2>/dev/null)" ];then
	VI="vim"
	mkdir -p ~/.vim
	ln -s `pwd`/nvim/bundle ~/.vim/bundle
	$VI +PluginInstall +qall >/dev/null 2>&1
	print_result "vim plugins"
fi
if [ ! -z "$(which nvim 2>/dev/null)" ];then
	VI="nvim"
elif [ -z $VI ];then
	echo "please install vim or neovim first"
	exit 1
fi
$VI +PluginInstall +qall --headless >/dev/null 2>&1
print_result "neovim plugins"

if [ -d ~/.config/awesome ] && [ -L ~/.config/awesome ];then
	rm ~/.config/awesome
else
	mv ~/.config/awesome ~/.config/awesome$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/awesome ~/.config/awesome
print_result "awesome wm conf files"

if [ -d ~/.config/i3 ] && [ -L ~/.config/i3 ];then
	rm ~/.config/i3
else
	mv ~/.config/i3 ~/.config/i3$timenow > /dev/null 2>&1
fi

ln -s "`pwd`"/i3 ~/.config/i3
print_result "i3 wm conf files"

if [ -d ~/.oh-my-zsh ] && [ -L ~/.oh-my-zsh ];then
	rm ~/.oh-my-zsh
else
	mv ~/.oh-my-zsh ~/.oh-my-zsh$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/oh-my-zsh ~/.oh-my-zsh
print_result "oh-my-zsh"

if [ -L ~/.powerline ];then
	rm ~/.powerline
elif [ -d ~/.powerline ];then 
	mv ~/.powerline ~/.powerline$timenow > /dev/null 2>&1
fi
ln -s "`pwd`"/powerline ~/.powerline
print_result "powerline"
# install for user
pip install --user wheel -q && pip install --user --editable=powerline -q && pip install --user powerline-status -q
print_result "powerline python bindings"

wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf -O ~/.local/share/fonts/Monaco.ttf > /dev/null 2>&1
print_result "monaco fonts"

fonts/install.sh > /dev/null 2>&1
print_result "powerline fonts"
