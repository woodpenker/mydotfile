#!/bin/bash
if which tmux;then
   echo "tmux exists"
else
    echo "tmux not install"
    exit 1
fi
current_dir="$(pwd)"
if [ ! -e "$HOME/.tmux/plugins" ];then
    mkdir -p "$HOME/.tmux/plugins"
fi
cd "$HOME/.tmux/plugins"
if [ ! -e "$HOME/.tmux/plugins/tmux-resurrect" ];then
    git clone https://github.com/tmux-plugins/tmux-resurrect.git
fi
if [ ! -e "$HOME/.tmux/plugins/tmux-continuum" ];then
    git clone https://github.com/tmux-plugins/tmux-continuum.git
fi
if [ ! -e "$HOME/.tmux/plugins/tpm" ];then
    git clone https://github.com/tmux-plugins/tpm
fi
if which vim;then
    if [ ! -e "$HOME/.vim/bundle" ];then
        mkdir -p "$HOME/.vim/bundle"
    fi
    cd $HOME/.vim/bundle
    if [ ! -e "$HOME/.vim/bundle/vim-obsession" ];then
        git clone git://github.com/tpope/vim-obsession.git
        vim -u NONE -c "helptags vim-obsession/doc" -c q
    fi
else
    echo "vim not install"
    exit 1
fi
cd "${current_dir}"
cp tmux.conf $HOME/.tmux.conf
cp up.sh $HOME/up.sh
chmod +x $HOME/up.sh
cp zshrc $HOME/.zshrc
if which zhs;then
    chsh -s $(which zsh)
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    source $HOME/.zshrc
else
    echo "zsh not install"
    exit 1
fi

