#!/bin/bash

echo "start vim initialing..."

install_pathogen() {
    echo "installing pathogen..."

    if [ ! -d ~/.vim/autoload ]; then
        mkdir -p ~/.vim/autoload 
    fi
    
    if [ ! -d ~/.vim/bundle ]; then
        mkdir -p ~/.vim/bundle
    fi

    if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
}

install_plugin() {
    line=$1
    plugin_url=${line##* }
    plugin=${plugin_url%%.git}
    plugin=${plugin##*/}

    pushd ~/.vim/bundle

    if [ -d $plugin ]; then
        echo "plugin $plugin alreay installed, skip"
    else
        echo "installing $plugin from $plugin_url..."
        git clone $plugin_url 
    fi

    popd
}

install_plugins() {
    echo "installing plugins..."
    while read line
    do
        install_plugin "$line"
    done < plugins.conf
}

install_molokai() {
    echo "use molokai theme..."
    molokai_url="https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
    if [ ! -d ~/.vim/colors ]; then
        mkdir -p ~/.vim/colors 
    fi
    curl -o ~/.vim/colors/molokai.vim $molokai_url

}

setup_basic_softwares() {
    sudo apt-get update 

    pkgs="zsh vim git ipython curl tmux exuberant-ctags"
    for pkg in $pkgs
    do
        sudo apt-get install -y $pkg
    done
}

setup_vim() {
    install_pathogen
    install_plugins
    install_molokai
    ln ../vimrc ~/.vimrc
}

setup_zsh(){
    # download and install shell
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh

    # change zsh to default shell
    chsh -s $(which zsh)

    echo "alias tmux=\"TERM=screen-256color-bce tmux\"" >> ~/.zshrc
}

setup_git() {
    ln ../gitconfig ~/.gitconfig
}

setup_tmux() {
    ln ../tmux.conf ~/.tmux.conf
}

run() {
    setup_basic_softwares
    setup_vim
    setup_zsh
    setup_git
    setup_tmux
}

run
