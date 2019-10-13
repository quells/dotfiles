#!/bin/sh

# Base packages
git clone --depth=1 https://github.com/ajh17/Spacegray.vim;
git clone --depth=1 https://github.com/tpope/vim-commentary;
git clone --depth=1 https://github.com/tpope/vim-fugitive;

# Language support
git clone --depth=1 https://github.com/pangloss/vim-javascript;
git clone --depth=1 https://github.com/fatih/vim-go.git;
git clone --depth=1 https://github.com/dgryski/vim-godef;

# Shell support
git clone --depth=1 https://github.com/dag/vim-fish;
