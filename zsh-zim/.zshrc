
#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# autoload -U compinit
# compinit -i

# Some basic settings
HISTSIZE=10000 # session history size
SAVEHIST=10000 # saved history
HISTFILE=$HOME/.zshistory # history file
ZLE_RPROMPT_INDENT=0

setopt shwordsplit	         # make sure that $arm works fine
setopt nobgnice              # run bg jobs at full speed
setopt complete_in_word      # allow tab completion in the middle of a word
setopt always_to_end         # Place cursor at end after completion
setopt no_auto_remove_slash  # do not remove slash on directory completion
setopt append_history        # append
setopt hist_ignore_all_dups  # no duplicate
setopt hist_reduce_blanks    # trim blanks
setopt hist_verify           # show before executing history commands
setopt inc_append_history    # add commands as they are typed, don't wait until shell exit
setopt share_history         # share hist between sessions
setopt bang_hist             # !keyword
setopt MULTIOS               # write to multiple files
setopt auto_remove_slash     # self explicit
setopt clobber               # clobber on redirect
setopt interactive_comments  # enable interactive comments
setopt aliases               # enable aliases

unsetopt correct_all	       # do not correct all automatically
unsetopt beep                # disable audible bell
unsetopt hist_ignore_space   # ignore space prefixed commands
unsetopt rm_star_silent      # ask for confirmation for `rm *' or `rm path/*'
unsetopt hup                 # no hup signal at shell exit
unsetopt flowcontrol	       # ctr-s/q has not effect now (Thanx!!!)
unsetopt AUTO_NAME_DIRS
# umask for new folders and files
umask 022

# Directories
# zstyle ':completion:*:default' list-colors ''

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
       'm:{a-z\-}={A-Z\_}' \
       'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
       'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ":completion:*:commands" rehash 1
zstyle ':completion:*' use-ip true

# List hidden files and folder during completion by default
_comp_options+=(globdots)

# color gcc
export GCC_COLOR="auto"

# generic env setting
export TERMINFO=/lib/terminfo	# required for gdb-tui
export TZ='Asia/Kolkata'; export TZ
export LC_ALL='en_US.UTF-8'
export GREP_COLORS='mt=33;40;1'

export TERM="xterm-256color"
[[ $TMUX = "" ]] && export TERM="xterm-256color"
# [[ $TMUX = "" ]] && export TERM="xterm-256color-italic"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c"
export GIT_EDITOR="emacsclient -c"
export LESS_TERMCAP_md="$ORANGE"
export MINICOM="-m -c on -w -z"	# start minicom in color
export PAGER="less"

# fasd initialization
# eval "$(fasd --init auto)"

# init autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
export AUTOJUMP_IGNORE_CASE=1 # ignore case in autojump completion
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim make'

# configure fzf plugin
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history substring search module
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=234,fg=10'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=234,fg=9'
bindkey -M emacs "^p" history-substring-search-up
bindkey -M emacs "^n" history-substring-search-down
bindkey -M emacs '^r' history-incremental-search-backward

# zsh highlighting module
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_PATTERNS+=('rm -fr ' 'fg=red,bold')
ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=red,bold')

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=9'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=11'
ZSH_HIGHLIGHT_STYLES[alias]='fg=27'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=65'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=13'
ZSH_HIGHLIGHT_STYLES[function]='fg=6'
ZSH_HIGHLIGHT_STYLES[command]='fg=27'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=5'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=202,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=202,bold' #*
ZSH_HIGHLIGHT_STYLES[path]='fg=150'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=33,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=101,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=160,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=178'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=174,underline'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=197,italic'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=10,italic'
ZSH_HIGHLIGHT_STYLES[back-hyphen-option]='fg=10,italic' #*
ZSH_HIGHLIGHT_STYLES[back-quoted-option]='fg=10,italic' #*
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=101'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=101'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=102' #*
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=102' #*
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=102' #*
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=10' #*
ZSH_HIGHLIGHT_STYLES[assign]=none #*
ZSH_HIGHLIGHT_STYLES[redirection]='fg=5'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8,italic'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=27'
ZSH_HIGHLIGHT_STYLES[root]='standout'
ZSH_HIGHLIGHT_STYLES[default]='fg=246'

# zsh auto-suggestions module
bindkey '^ ' autosuggest-accept
# bindkey "^M" accept-line
ZSH_AUTOSUGGEST_STRATEGY='match_prev_cmd'
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(emacs-forward-word)

# Enable multiselection of items
zmodload zsh/complist
bindkey -M menuselect "=" accept-and-menu-complete

# Meta-u to chdir to the parent directory
bindkey -s '\eu' '^Ucd ..; ls^M'

bindkey "^[s" prepend-sudo
bindkey -M emacs "$key_info[Control]X$key_info[Control]S" prepend-sudo

# global alias expansion keys
bindkey ' '    _expand-ealias
# bindkey '^ '   magic-space          # control-space to bypass completion
bindkey -M isearch " "  magic-space # normal space during searches

# Remove the prefix prompt when logged as ratheesh
export DEFAULT_USER=`whoami`

# ------------- CUSTOM SETTINGS ----------------
# enable ccache for faster rebuilds
export USE_CCACHE=1

# Python virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# xilinx devel setup
alias cgdb-xilinx='cgdb -d arm-xilinx-linux-gnueabi-gdb -- -quiet'
export arm='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'
export xilinx='ARCH=arm CROSS_COMPILE=arm-xilinx-linux-gnueabi-'

# freescale devel settings
alias cgdb_fscl='cgdb -d arm-linux-gnueabihf-gdb -- -quiet'
export fscl='ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-'

# freescale devel settings
alias cgdb_logicpd='cgdb -d arm-none-linux-gnueabi-gdb -- -quiet'
export logicpd='ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'

path=(
    $HOME/bin
    $HOME/.local/bin
    $HOME/.autojump/bin
    /opt/Xilinx/SDK/2015.1/gnu/arm/lin/bin
    /opt/Xilinx/SDK/2015.1/bin
    /opt/gcc-arm-none-eabi-4_7-2013q1/bin
    /opt/mgls/linux/bin
    /usr/lib/llvm-3.6/bin	# for clang
    /opt/SEGGER/JLink
    /opt/CodeSourcery/arm-2011.09/bin
    /home/ratheesh/projects/nextnav/regina/ltib_logicpd_243/bin
    $path
)

# Customize to your needs...
PATH="/home/ratheesh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ratheesh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ratheesh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ratheesh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ratheesh/perl5"; export PERL_MM_OPT;

# End of File
