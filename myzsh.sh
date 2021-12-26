#!/bin/bash

#chsh -s /bin/zsh # CentOS 改默认shell为zsh，可不用

_help() {
	echo
	echo "........... myzsh .........."
	echo -e "
	./myzsh.sh install
	

"
}
_install() {
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc
	sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
	
	##插件zsh-syntax-highlighting，语法高亮
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	##插件zsh-autosuggestions，提示补全
	git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	zsh
}




args=$1
[ -z $1 ] 
case $args in

install)
	_install
	;;
	
help | *)
	_help
	;;
	
esac
