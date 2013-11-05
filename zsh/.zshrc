# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="random"
#export ZSH_THEME="jnrowe"
#export ZSH_THEME="agnoster"
export ZSH_THEME="muse"
#export ZSH_THEME="miloshadzic"
#export ZSH_THEME="sorin"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux git github git-flow bundler colorize cp)

source $ZSH/oh-my-zsh.sh

TZ='Asia/Kolkata'; export TZ

#enable 256color for terminal multiplexs
#DISABLE_AUTO_TITLE=true #No auto title rename, keeps my tmux happy
# Customize to your needs...

#ZSH specific
alias mkdir='nocorrect mkdir'
setopt shwordsplit
unsetopt correct_all

# Enwicklung Optionen
# Emacs
export ALTERNATE_EDITOR=""
alias e="emacsclient -nc"
alias ec="emacsclient -t"
alias eckill="emacsclient -e '(kill-emacs)'"

export arm='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'
export GIT_EDITOR='emacsclient -t'

# Machine dependent - change as per the need
export PATH=/usr/local/bin:/usr/bin:/home/ratheesh/bin:/usr/local/sbin:/usr/sbin
export PATH=$HOME/.local/bin:/opt/arm-2013.05/bin/:$PATH
export SRC='/data/ratheesh/beagle_Bone/git'

# Powerline specific
#if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

#End of File

