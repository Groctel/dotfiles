" INIT.VIM BY ATANASIO 'GROCTEL' RUBIO ---- taxorubio@gmail.com

" DEPENDENCIES: {{{1
" - ctags : Index language objects (functions, data members and so on)
" - eslint : Javascript language server (also requires npm)
" - neovim-nightly-git : Latest version of Neovim required by many plugins
" - ngrok : Set up public server for instant.nvim
" - pyright : Python language server
" - python-pynvim : Python support for many plugins
" - tree-sitter : Parsing system for syntax and other language features
" }}}1

" Options setting {{{1
if &compatible | set nocompatible | endif
if (has('nvim') || has('termguicolors')) | set termguicolors | endif

set autoindent " Start new lines correctly indented
set colorcolumn=81 " Draw column at line character limit
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
let mapleader = " "

filetype plugin indent on " Required by plugins
syntax on
" }}}1

" Plugins {{{
" Autoinstall vim-plug {{{2
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | qa!
endif
" }}}2
let loaded_netrwPlugin = 1 " I can't close netrw :(
call plug#begin('~/.config/nvim/plugged')

" Plug 'justinmk/vim-sneak'
" Plug 'liuchengxu/vista.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/asyncrun.extra'
" Plug 'skywind3000/asynctasks.vim'
	" let g:asynctasks_term_pos = "floaterm_reuse"
" Plug 'voldikss/vim-floaterm'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'TimUntersberger/neogit'
	Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
" Plug 'nvim-lua/completion-nvim'
" 	set completeopt=menuone,noinsert,noselect
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'

" Default settings plugins {{{
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/galaxyline.nvim'
Plug 'junegunn/vim-plug'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim'
" }}} 2
Plug 'andweeb/presence.nvim' " {{{2
	let g:presence_auto_update       = 1
	let g:presence_neovim_image_text = "github.com/groctel/dotfiles"
" }}}2
Plug 'dense-analysis/ale' " {{{2
	let g:ale_linters = {
		\ 'c'    : ['gcc'],
		\ 'cpp'  : ['g++'],
		\ 'java' : ['javac'],
		\ 'javascript' : ['eslint'],
		\ 'ruby': []
	\}
	let g:ale_change_sign_column_color = 1
	let g:ale_sign_error               = ' ✘'
	let g:ale_sign_warning             = ' ●'

	let g:ale_c_cc_options             = '-std=c18 -Wall -Wextra -Wpedantic -Wfloat-equal'
	let g:ale_cpp_cc_options           = '-std=c++17 -Wall -Wextra -Wpedantic -Wfloat-equal -I./'
	let g:ale_c_parse_makefile         = 1
	let g:ale_c_parse_compile_commands = 0

	let g:ale_haskell_ghc_options        = '-dynamic'
	let g:airline#extensions#ale#enabled = 0
" }}}2
Plug 'folke/tokyonight.nvim' " {{{2
	let g:tokyonight_style = "night"
	" Plug 'challenger-deep-theme/vim', {'as' : 'challenger-deep'} " 2blue4me
	" Plug 'ghifarit53/tokyonight-vim' " Different colors, no explicit nvim support
" }}}2
Plug 'glepnir/dashboard-nvim' " {{{2
	runtime viml/dashboard-splash.vim
	" let g:dashboard_custom_section = {
	" 	\ 'buffer_list': {
	" 		\ 'description': [' Open empty buffer                          SPC b b'],
	" 		\ 'command': ''
	" 	\},
	" \}
	augroup Dashboard
		autocmd!
		autocmd FileType dashboard setlocal laststatus=0 noruler
	augroup END
" }}}2
Plug 'jbyuki/instant.nvim' " {{{3
	" Run `ngrok http <port>` (for example port 8080) and get the forwarding
	" address minus https://. Use it in `:InstantStartServer <address> <port>`
	let g:instant_username = "Groctel"
" }}}3
Plug 'junegunn/goyo.vim' " {{{2
	Plug 'junegunn/limelight.vim'
	augroup Goyo
		autocmd!
		autocmd User GoyoEnter Limelight
		autocmd User GoyoLeave Limelight!
	augroup END
" }}}2
Plug 'junegunn/vim-easy-align' " {{{2
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
" }}}2
Plug 'lervag/vimtex' " {{{2
	let g:tex_flavor              = 'latex'
	let g:vimtex_compiler_enabled = 0

	let g:vimtex_indent_enabled      = 0
	let g:vimtex_indent_bib_enabled  = 0
	let g:vimtex_indent_conditionals = {}
	let g:vimtex_indent_delims       = {}
	let g:vimtex_indent_lists        = []
" }}}2
Plug 'mattn/emmet-vim' " {{{2
	imap <C-b><C-b> <plug>(emmet-expand-abbr)
	imap <C-b>;     <plug>(emmet-expand-word)
	imap <C-b>u     <plug>(emmet-update-tag)
	imap <C-b>d     <plug>(emmet-balance-tag-inward)
	imap <C-b>D     <plug>(emmet-balance-tag-outward)
	imap <C-b>n     <plug>(emmet-move-next)
	imap <C-b>N     <plug>(emmet-move-prev)
	imap <C-b>i     <plug>(emmet-image-size)
	imap <C-b>/     <plug>(emmet-toggle-comment)
	imap <C-b>j     <plug>(emmet-split-join-tag)
	imap <C-b>k     <plug>(emmet-remove-tag)
	imap <C-b>a     <plug>(emmet-anchorize-url)
	imap <C-b>A     <plug>(emmet-anchorize-summary)
	imap <C-b>m     <plug>(emmet-merge-lines)
	imap <C-b>c     <plug>(emmet-code-pretty)
" }}}2
Plug 'tpope/vim-commentary' " {{{2
	augroup CommentStrings
		autocmd!
		autocmd FileType inform setlocal commentstring=!\ %s
	augroup END
" }}}2
Plug 'mbbill/undotree' " {{{2
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_ShortIndicators    = 1
	let g:undotree_TreeNodeShape      = '◯'
	let g:undotree_WindowLayout       = 2
" }}}2
Plug 'sirver/UltiSnips' " {{{2
	let g:UltiSnipsExpandTrigger       = "<Tab>"
	let g:UltiSnipsJumpForwardTrigger  = "<C-B>"
	let g:UltiSnipsJumpBackwardTrigger = "<C-Z>"
	let g:UltiSnipsEditSplit           = "vertical"
" }}}2
call plug#end()

" Configure Lua plugins {{{2
lua << EOF
require('bufferline').setup {
	show_tab_indicators    = true,
	always_show_bufferline = true,
}
require('neogit').setup{}
require('neonline')
require('which-key-config')
require('colorizer').setup()
require('nvim-treesitter.configs').setup {
	highlight = {
		enable  = true,
		disable = {"bash"}
	},
	incremental_selection = {
		enable = true
	},
	textobjects = {
		enable = true
	},
}
require('lspconfig').pyright.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').vimls.setup{}
require('lspconfig').intelephense.setup{}
require('lspconfig').texlab.setup{}
require('lspconfig').solargraph.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').ccls.setup{
	root_dir = dirname
}
require('lspconfig').jsonls.setup{}
require('lspconfig').cssls.setup{}
EOF
" }}}2
" }}}1

" Custom commands {{{1
command! W w
command! Wq wq
command! Wqa wqa
command! Q q
command! Qa qa

" Translate Markdown bold text to LaTeX textbf
command! MDTexBf execute "%s/\\*\\{2\\}\\([^\\*\\{2\\}]\\+\\)\\*\\{2\\}/\\\\textbf{\\1}/g"
" Translate Markdown 1st level titling to LaTeX chapter
command! MDTexChapter execute "%s/^# \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\chapter{\\1}/g"
" Translate itemize items to LaTeX style code
command! MDTexItem execute "%s/^\\([\\t ]*\\)-/\\1\\\\item/g"
" Translate Markdown 2nd level titling to LaTeX section
command! MDTexSection execute "%s/^## \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\section{\\1}/g"
" Translate Markdown 3rd level titling to LaTeX subsection
command! MDTexSubsection execute "%s/^### \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\subsection{\\1}/g"
" Translate Markdown inline code to LaTeX style code
command! MDTexTt execute "%s/`\\([^`]\\+\\)`/\\\\texttt{\\1}/g"
" }}}1

function! CloseOnLast() " {{{1
	let cnt = 0

	for i in range(0, bufnr("$"))
		if buflisted(i)
			let cnt += 1
		endif
	endfor

	if cnt > 2
		bprevious|split|bnext|bdel
	elseif cnt == 2
		bdel
	else
		q
	endif
endfunction
" }}}1
function! s:SpacesToTabs (spaces_length) abort " {{{1
	while v:true
		%s/^\(\t*\) \{a:spaces_length\}/\1\t/
	endwhile
endfunction
command! -nargs=1 SpacesToTabs call s:SpacesToTabs(<args>)
" }}}1

augroup Automations "{{{1
	autocmd!
	autocmd BufWritePre  * silent! undojoin | %s/\s\+$//e
	autocmd FileType fugitive,fugitiveblame,git setlocal colorcolumn=
	" autocmd FileType help set nowrap nolinebreak
augroup END
" }}}1
augroup ForceFiletypes " {{{1
	autocmd!
	autocmd BufNewFile,BufRead *.cls  set filetype=plaintex
	autocmd BufNewFile,BufRead *.sty  set filetype=plaintex
	autocmd BufNewFile,BufRead *.tikz set filetype=tex
	autocmd BufNewFile,BufRead *.tpp  set filetype=cpp
augroup END
" }}}1

" Custom mappings {{{1
nnoremap Y y$
noremap <silent> <C-N> :bnext<CR>
noremap <silent> <C-P> :bprev<CR>
noremap <silent> Q :call CloseOnLast()<CR>
tnoremap <Esc><Esc> <C-\><C-n>
" }}}1

" Visual style {{{1
set listchars=tab:\|\ ,trail:· list "»>
colorscheme tokyonight

highlight  ColorColumn  guibg=#24283b
highlight! CursorLine   guibg=normal_bg
highlight! CursorLineNr guibg=normal_bg
" }}}1

