" INIT.VIM BY ATANASIO 'GROCTEL' RUBIO ---- taxorubio@gmail.com

" Dependencies
" - ctags : Index language objects (functions, data members and so on)
" - eslint : Javascript language server (also requires npm)
" - neovim-nightly-git : Latest version of Neovim required by many plugins
" - ngrok : Set up public server for instant.nvim
" - pyright : Python language server
" - python-pynvim : Python support for many plugins
" - tree-sitter : Parsing system for syntax and other language features

" Options settings
if &compatible | set nocompatible | endif
if (has('nvim') || has('termguicolors')) | set termguicolors | endif

runtime viml/options.vim
runtime viml/plugins.vim

" Custom commands
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

augroup Automations
	autocmd!
	autocmd BufWritePre  * silent! undojoin | %s/\s\+$//e
	autocmd FileType fugitive,fugitiveblame,git setlocal colorcolumn=
	" autocmd FileType help set nowrap nolinebreak
augroup END

augroup ForceFiletypes
	autocmd!
	autocmd BufNewFile,BufRead *.cls  set filetype=plaintex
	autocmd BufNewFile,BufRead *.sty  set filetype=plaintex
	autocmd BufNewFile,BufRead *.tikz set filetype=tex
	autocmd BufNewFile,BufRead *.tpp  set filetype=cpp
augroup END

" Eyecandy
set listchars=tab:\|\ ,trail:· list "»>
colorscheme tokyonight

" Highlight groups
highlight  ColorColumn  guibg=#24283b
highlight! CursorLine   guibg=normal_bg
highlight! CursorLineNr guibg=normal_bg

" Mappings
nnoremap Q <cmd>close<cr>
nnoremap Y y$
nnoremap <C-n> <cmd>bnext<cr>
nnoremap <C-p> <cmd>bprev<cr>
tnoremap <Esc><Esc> <C-\><C-n>