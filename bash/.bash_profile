# bash profile

umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/.fzf/bin:$HOME/.local/share/nvim/mason/bin:$PATH"
fi

PATH="$HOME/gems/bin:$HOME/.cargo/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[[ -d "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

export PATH

# End of File
