let mapleader = " " " Set leader key to space to call which-key

set autoindent " Start new lines correctly indented
set colorcolumn=81 " Draw column at line character limit
set completeopt=menuone,noselect " Completion engine options
set fixeol " Restore EOL at EOF if missing when writing
set foldmethod=marker " Only allow foldings with triple brackets
set guicursor=a:block " Force cursor to be a block at all times
set hidden " Hide inactive buffers instead of deleting them
set hlsearch " Highlight all search matches
set inccommand=split " Incrementally show effects of commands, opens split
set incsearch " Highlight search matches while writing (with hlsearch)
set linebreak " Respect WORDS when wrap-breaking lines (see wrap)
set mouse=nvi " Allow mouse everywhere except in command line mode
set noexpandtab " Do not expand tabs to spaces (see softtabstop)
set number " Number column to the left (used with relativenumber)
set relativenumber " Show numbers relative to cursor position (see number)
set scrolloff=5 " Leave 5 lines above and below cursor
set shiftwidth=0 " Force indent spaces to equal to tabstop (see tabstop)
set shortmess+=c " Avoid blocking 'Pattern not found' messages
set showcmd " Show the keys pressed in normal mode until action is run
set smartindent " Ident new lines in a smart way (see autoindent)
set smarttab " Treat spaces as tabs in increments of shiftwidth
set softtabstop=0 " Do not insert spaces when pressing tab (see shiftwidth)
set splitbelow " Open splits below the current window
set splitright " Open splits right of the current window
set tabstop=3 " Number of columns to move when pressing <TAB> (see noexpandtab)
set timeoutlen=500 " Milliseconds to wait before completing a mapped sequence
set updatetime=300 " Milliseconds to wait before writing to swap file
set wrap " Continue on the next line if insufficient columns (see linebreak)

filetype plugin indent on " Required by plugins
syntax on " Highlight symbols
