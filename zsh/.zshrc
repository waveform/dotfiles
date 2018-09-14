# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#  export ZSH=/home/stawan01/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

source $HOME/dotfiles/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git

antigen bundle autojump
#antigen bundle common-aliases
#antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-completions

antigen theme robbyrussell

antigen apply

# User configuration

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:~/anaconda3/bin:~/fun/dasht/bin:~/.cargo/bin::/home/stawan01/prj/gcc-arm-none-eabi-7-2017-q4-major/bin
export BENNTO=/home/stawan01/prj/pathfinding/compiler/marvin_model/bennto
export MARVIN_MODEL_FASTMODEL_LIB=/home/stawan01/prj/pathfinding/compiler/marvin_model/2018-08-18/cadi_system_Linux64-Debug-GCC-4.8.so
export HISTCONTROL=ignorespace:erasedups
export MANPATH=$MANPATH:/home/stawan01/fun/dasht/man

declare -x ARMLMD_LICENSE_FILE="7010@euhpc-lic03.euhpc.arm.com:7010@euhpc-lic04.euhpc.arm.com:7010@euhpc-lic05.euhpc.arm.com:7010@euhpc-lic07.euhpc.arm.com:8224@blr-lic03.blr.arm.com:8224@blr-lic04.blr.arm.com:8224@blr-lic05.blr.arm.com:7010@nahpc-lic06.nahpc.arm.com:7010@nahpc-lic09.nahpc.arm.com"
declare -x ARMLMD_LICENSE_FILE_modshare="7010@euhpc-lic04.euhpc.arm.com:1:7010@nahpc-lic06.nahpc.arm.com:1:7010@euhpc-lic05.euhpc.arm.com:1:8224@blr-lic03.blr.arm.com:1:8224@blr-lic04.blr.arm.com:1:7010@euhpc-lic03.euhpc.arm.com:1:7010@euhpc-lic07.euhpc.arm.com:1:8224@blr-lic05.blr.arm.com:1:7010@nahpc-lic09.nahpc.arm.com:1"
declare -x FLEXLM_NO_CKOUT_INSTALL_LIC="1"
declare -x LM_LICENSE_FILE=":1661@euhpc-lic05.euhpc.arm.com"
declare -x LM_LICENSE_FILE_modshare="1661@euhpc-lic05.euhpc.arm.com:1"
declare -x LM_PROJECT="PJ03256"
declare -x SNPSLMD_DISABLE_DEBUG_LICENSE_CHECKS="1"
declare -x SNPSLMD_LICENSE_FILE="2700@euhpc-lic10.euhpc.arm.com:2700@euhpc-lic11.euhpc.arm.com:2700@euhpc-lic08.euhpc.arm.com:2700@euhpc-lic09.euhpc.arm.com:2700@nahpc-lic13.nahpc.arm.com:2700@nahpc-lic17.nahpc.arm.com:2700@nahpc-lic01.nahpc.arm.com:2700@nahpc-lic05.nahpc.arm.com:27000@blr-lic01.blr.arm.com:27000@blr-lic02.blr.arm.com"
declare -x SNPSLMD_LICENSE_FILE_modshare="2700@nahpc-lic01.nahpc.arm.com:1:2700@nahpc-lic05.nahpc.arm.com:1:27000@blr-lic01.blr.arm.com:1:2700@euhpc-lic08.euhpc.arm.com:1:27000@blr-lic02.blr.arm.com:1:2700@euhpc-lic10.euhpc.arm.com:1:2700@euhpc-lic09.euhpc.arm.com:1:2700@euhpc-lic11.euhpc.arm.com:1:2700@nahpc-lic13.nahpc.arm.com:1:2700@nahpc-lic17.nahpc.arm.com:1"

source ~/dotfiles/zsh/zsh.conf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
