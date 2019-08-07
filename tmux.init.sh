#!/bin/bash
cd $HOME/
mkdir -p $HOME/.tmux/plugins
cd $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-resurrect.git
git clone https://github.com/tmux-plugins/tmux-continuum.git
git clone https://github.com/tmux-plugins/tpm
cd $HOME/.vim/bundle
git clone git://github.com/tpope/vim-obsession.git
vim -u NONE -c "helptags vim-obsession/doc" -c q
cp tmux.conf $HOME/.tmux.conf
