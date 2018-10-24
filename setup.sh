#!/usr/bin/env bash
git submodule update --init
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall

if [ -x "$(command -v npm)" ]; then
    npm -g install instant-markdown-d
fi
