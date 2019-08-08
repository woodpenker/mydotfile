#!/bin/bash
if which tmux;then
   echo "tmux exists"
else
    echo "tmux not install"
    exit 1
fi
cd $HOME/
mkdir -p $HOME/.tmux/plugins
cd $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-resurrect.git
git clone https://github.com/tmux-plugins/tmux-continuum.git
git clone https://github.com/tmux-plugins/tpm
if which vim;then
if [ ! -e $HOME/.vim/bundle ];then
    mkdir -p $HOME/.vim/bundle
fi
cd $HOME/.vim/bundle
git clone git://github.com/tpope/vim-obsession.git
vim -u NONE -c "helptags vim-obsession/doc" -c q
else
    echo "vim not install"
fi
cp tmux.conf $HOME/.tmux.conf
cp up.sh $HOME/up.sh
chmod +x $HOME/up.sh
cp zshrc $HOME/.zshrc
if which zhs;then
    chsh -s $(which zsh)
else
    echo "zsh not install"
    exit 1
fi
source $HOME/.zshrc
