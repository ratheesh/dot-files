#/usr/bin/env bash
# Copyright (C) 2015  Ratheesh S<ratheeshreddy@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.

TARGET_DIR=$HOME

`hash stow` > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo "Error: stow is not installed in the system"
    echo "Install GNU Stow and retry."
    exit 1
fi

for i in "cgdb" "emacs" "screen" "tmux" "vim" "X" "zsh" "gitconfig";do
    echo "Installing $i ..."
    stow -v -R -t $TARGET_DIR $i
    echo
done

# This should be copied manually due to email id difference
# cp -v $PWD/git/.gitconfig $TARGET_DIR

# End of File
