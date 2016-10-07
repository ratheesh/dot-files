# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ratheesh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages command-not-found common-aliases cp history \
	     history-substring-search jump man mosh python pip pyenv rsync \
	     ssh-agent sudo svn themes tmuxinator zsh-syntax-highlighting \
	     zsh-autosuggestions)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
if [[ -z "$LANG" ]]; then
	  export LANG='en_US.UTF-8'
	  export LC_ALL='en_US.UTF-8'
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export GIT_EDITOR='emacsclient -t'
	export EDITOR='emacsclient -t'
	export VISUAL='nano'
	export PAGER='less'
	export ALTERNATE_EDITOR=""
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# -- from .zprofile --
typeset -gU cdpath fpath mailpath path
export LESS='-F -g -i -M -R -S -w -X -z-4'

# -- .zshrc --

# Some basic settings
HISTSIZE=10000 # session history size
SAVEHIST=10000 # saved history
HISTFILE=$HOME/.zshistory # history file
ZLE_RPROMPT_INDENT=0

unsetopt beep
setopt shwordsplit	         # make sure that $arm works fine
setopt nobgnice              # run bg jobs at full speed
setopt complete_in_word      # allow tab completion in the middle of a word
setopt always_to_end         # Place cursor at end after completion
unsetopt flowcontrol	     # ctr-s/q has not effect now (Thanx!!!)
setopt append_history        # append
setopt hist_ignore_all_dups  # no duplicate
unsetopt hist_ignore_space   # ignore space prefixed commands
setopt hist_reduce_blanks    # trim blanks
setopt hist_verify           # show before executing history commands
setopt inc_append_history    # add commands as they are typed, don't wait until shell exit
setopt share_history         # share hist between sessions
setopt bang_hist             # !keyword
setopt MULTIOS
unsetopt rm_star_silent      # ask for confirmation for `rm *' or `rm path/*'
unsetopt hup                 # no hup signal at shell exit
setopt auto_remove_slash     # self explicit

# history substring search
bindkey -M emacs "^p" history-substring-search-up
bindkey -M emacs "^n" history-substring-search-down
bindkey -M emacs '^r' history-incremental-search-backward

# alias -g es
alias -g ls='ls --color=auto'
alias -g mkdir='nocorrect mkdir'
alias -g e="emacsclient -nc"
alias -g ec="emacsclient -t"
alias -g en="emacsclient -n"
alias -g eckill="emacsclient -e '(kill-emacs)'"
alias -g tmux='tmux -2 -u'
alias -g mux=tmuxinator
alias -g ack="ack-grep --pager=\"less -R\""
alias -g rsyncp='rsync -avz -e ssh --progress --partial '

# generic env setting
export TERMINFO=/lib/terminfo	# required for gdb-tui
export TZ='Asia/Kolkata'; export TZ

[[ $TMUX = "" ]] && export TERM="xterm-256color"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c"
export GIT_EDITOR="emacsclient -c"
export LESS_TERMCAP_md="$ORANGE"
export MINICOM="-m -c on -w -z"	# start minicom in color

export PAGER="less"

# fasd initialization
eval "$(fasd --init auto)"
alias -g v='f -e vim'      # quick opening files with vim
alias -g m='f -e mplayer'  # quick opening files with mplayer
alias -g o='a -e xdg-open' # quick opening files with xdg-open
alias -g enn='f -e emacsclient -nc'

# init autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export AUTOJUMP_IGNORE_CASE=1 # ignore case in autojump completion
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim make'

# configure fzf plugin
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# verbose for common commands
for c in chmod chown; do
    alias -g  $c="$c -v"
done

# verbose with interactive
for c in cp mv; do
    alias -g $c="$c -vi"
done

# Meta-u to chdir to the parent directory
bindkey -s '\eu' '^Ucd ..; ls^M'

# insert sudo on Meta-s
#insert_sudo () { zle beginning-of-line; zle -U "sudo " }
#zle -N insert-sudo insert_sudo
#bindkey "^[s" insert-sudo

# Remove the prefix prompt when logged as bricewge
DEFAULT_USER="ratheesh"
export DEFAULT_USER

zstyle ":completion:*:commands" rehash 1

# ------------- CUSTOM SETTINGS ----------------
# xilinx devel setup
alias -g cgdb-xilinx='cgdb -d arm-xilinx-linux-gnueabi-gdb -- -quiet'
export arm='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'
export xilinx='ARCH=arm CROSS_COMPILE=arm-xilinx-linux-gnueabi-'

# freescale devel settings
alias -g cgdb_fscl='cgdb -d arm-linux-gnueabihf-gdb -- -quiet'
export fscl='ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-'

# freescale devel settings
alias -g cgdb_logicpd='cgdb -d arm-none-linux-gnueabi-gdb -- -quiet'
export logicpd='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'

path=(
   #/usr/local/share/perl/5.18.2/auto/share/dist/Cope # ubuntu systems
    #/usr/local/share/perl/5.22.1/auto/share/dist/Cope
    $HOME/bin
    $HOME/.local/bin
    $HOME/.autojump/bin
    /usr/local/{bin,sbin}
	/{bin,sbin}
	/usr/{bin,sbin}
	/usr/local/{bin,sbin}
	/usr/{bin,sbin}

#   custom ones
    /opt/Xilinx/SDK/2015.1/gnu/arm/lin/bin
    /opt/Xilinx/SDK/2015.1/bin
    # /opt/arm-2014.05/bin
    # /opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux/bin
    /opt/gcc-arm-none-eabi-4_7-2013q1/bin
    /opt/mgls/linux/bin
    /usr/lib/llvm-3.6/bin	# for clang
    /opt/SEGGER/JLink
    /opt/CodeSourcery/arm-2011.09/bin
    /home/ratheesh/projects/nextnav/regina/ltib_logicpd_243/bin
    $path
)
# Customize to your needs...
#PATH="/home/ratheesh/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/ratheesh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/ratheesh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/ratheesh/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/ratheesh/perl5"; export PERL_MM_OPT;

# source /home/ratheesh/.zprezto/modules/globalias/init.zsh

# typeset -a ealiases
# ealiases=(`alias | sed -e 's/=.*//'`)

# _expand-ealias() {
#     if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" ]]; then
#         zle _expand_alias
#         zle expand-word
#     fi
#     zle magic-space
# }

# zle -N _expand-ealias

# bindkey ' '    _expand-ealias
# bindkey '^ '   magic-space          # control-space to bypass completion
# bindkey -M isearch " "  magic-space # normal space during searches
