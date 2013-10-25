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

#Set split sh word
setopt shwordsplit

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#ZSH specific
alias mkdir='nocorrect mkdir'

# Enwicklung Optionen
export PATH=/usr/local/bin:/usr/bin:/home/ratheesh/bin:/usr/local/sbin:/usr/sbin
export PATH=/opt/arm-2013.05/bin/:$PATH
export ALTERNATE_EDITOR=""
export SRC='/data/ratheesh/beagle_Bone/git'
export arm='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'
alias ec='emacsclient -t'
export GIT_EDITOR='emacsclient -t'

#End of File
