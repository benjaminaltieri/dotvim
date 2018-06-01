#!/usr/bin/env bash
git submodule update --init
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
