#!/bin/bash

set -e  # exit immediately if a pipeline, a list, or a compound command returns a non-zero status
set -u  # treat unset variables and parameters as an error
set -o pipefail

# update
sudo apt-get update

# wget git
sudo apt-get install wget git

# tmux
sudo apt-get install tmux

# rime
sudo apt-get install ibus-rime

# ctags
sudo apt-get install exuberant-ctags

# jq
sudo apt-get install jq

# sdcv
sudo apt-get install sdcv

###########
#  shell
###########

# zsh
sudo apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
echo 'config .zshrc by yourself!!'

# autojump antigen
sudo apt-get install autojump zsh-antigen


# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

###########
#  rust
###########

# rust
curl https://sh.rustup.rs -sSf | sh

# ripgrep
cargo install ripgrep

###########
#  nodejs
###########

# nodejs & npm
sudo apt-get install nodejs npm

# tldr
npm install -g tldr

###########
#  golang
###########

# pet
go get github.com/knqyf263/pet

# gotty
go get github.com/yudai/gotty

# todolist
go get github.com/gammons/todolist

