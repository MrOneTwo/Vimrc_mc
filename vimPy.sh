#!/bin/bash

dir1=/usr/lib/python2.7/config-x86_64-linux-gnu
dir2=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu
should_continue=false
RED='\033[0;31m'
GREEN='\033[0;32m'
LBLUE='\033[1;34m'
NC='\033[0m'
# Continued from above example
# echo -e "I ${RED}love${NC} Stack Overflow"

echo -e "${LBLUE}Installing dependencies in..."
echo "3s..."
sleep 1s
echo "2s..."
sleep 1s
echo "1s..."
sleep 1s
echo -e "Let's go!${NC}"
sleep 1s

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git \
    ncurses-dev

echo -e "${LBLUE}Remove old vim thingies..."
sleep 3s
echo -e "Let's go!${NC}"
sudo apt-get remove vim vim-runtime gvim

echo -e "${LBLUE}Checking if necessery folders exist..."
sleep 1s
if [ ! -d "$dir1" ]; then
    echo -e "${RED} [ NOK ] - ${LBLUE}No $dir1 folder.${NC}"
    dir1_exists=false
else
    echo -e "${GREEN} [ OK ] - ${LBLUE}$dir1 is present.${NC}"
    dir1_exists=true
fi
sleep 1s

if [ ! -d "$dir2" ]; then
    echo -e "${RED} [ NOK ] - ${LBLUE}No $dir2 folder.${NC}"
    dir2_exists=false
else
    echo -e "${GREEN} [ OK ] - ${LBLUE}$dir2 is present.${NC}"
    dir2_exists=true
fi
sleep 3s

if [ "$dir1_exists" = true ]  ; then
    if [ "$dir2_exists" = true ] ; then
         should_continue=true
    fi
fi

if [ "$should_continue" = true ] ; then
    echo -e "${LBLUE}Seems OK, continuing in 3s.${NC}"
    sleep 3s
else
    echo -e "${LBLUE}Doesn't seem OK. Continue? [y/n].${NC}"
    read should_continue
    if [ "$should_continue" == 'n' ]; then
        exit 1
    fi
fi

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=$dir1 \
            --enable-python3interp=yes \
            --with-python3-config-dir=$dir2 \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80

cd ~/vim
sudo make install

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

