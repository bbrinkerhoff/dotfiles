#!/bin/bash
# Clone amix/vimrc to ~/.vim_runtime if not already present
if [ ! -d "$HOME/.vim_runtime/.git" ]; then
    git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"
fi
