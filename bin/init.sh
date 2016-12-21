#!/bin/bash

set -o errexit   # exit when a command fails
set -o nounset   # exit when tries to use undeclared variables
set -o xtrace    # trace what gets executed
set -o pipefail  # exit when any command fails in a pipeline


echo "start vim initialing..."
DIR=$(cd `dirname ${BASE_SOURCE[0]}` && pwd)

install_vundle() {
    if [ ! -d ~/.vim/bundle ]; then
        mkdir -p ~/.vim/bundle
    fi

    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
}

install_plugins() {
    echo "installing plugins..."
    vim +PluginInstall +qall
}

install_molokai() {
    echo "use molokai theme..."
    molokai_url="https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
    if [ ! -d ~/.vim/colors ]; then
        mkdir -p ~/.vim/colors 
    fi

    if [ ! -f ~/.vim/colors/molokai.vim ]; then
        curl -o ~/.vim/colors/molokai.vim $molokai_url
    fi
}

setup_basic_softwares() {
    sudo apt-get update 

    pkgs="zsh vim git ipython curl tmux exuberant-ctags"
    sudo apt-get install -y $pkgs
}

setup_vim() {
    install_molokai
    if [ ! -f ~/.vimrc ]; then
        ln ${DIR}/../vimrc ~/.vimrc
    fi
    install_vundle
    install_plugins
}

setup_zsh(){
    # download and install zsh
    if ! which zsh ; then
        wget --no-check-certificate http://install.ohmyz.sh -O - | sh
        # change zsh to default shell
        sudo chsh -s $(which zsh)
        echo "alias tmux=\"TERM=screen-256color-bce tmux\"" >> ~/.zshrc
    fi

}

setup_git() {
    if [ ! -f ~/.gitconfig ]; then
        ln ${DIR}/../gitconfig ~/.gitconfig
    fi
}

setup_tmux() {
    if [ ! -f ~/.tmux.conf ]; then
        ln ${DIR}/../tmux.conf ~/.tmux.conf
    fi
}

run() {
    setup_basic_softwares
    setup_vim
    setup_git
    setup_tmux
    setup_zsh
}

run
