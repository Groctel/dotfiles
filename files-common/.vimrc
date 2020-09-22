" Groctel's vimrc
" ---------------
" This is the file where all my vim setup is stored. To load the plugins I use
" vim-plug (or just Plug). You can install it with this command:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" If it's the first time you run this vimrc, make sure to:
" - Install Plug with the command above
" - `so ~/.vimrc`
" - `PlugInstall`
" - `so ~/.vimrc`
" - Enjoy your Vim experience!

" Basic settings {{{1
if &compatible
	set nocompatible
endif

autocmd BufWritePre * silent! undojoin | %s/\s\+$//e
filetype plugin indent on " Required by plugins
let mapleader = ","
" }}}1

" Custom filetypes {{{1
autocmd BufNewFile,BufRead *.cls  set filetype=plaintex
autocmd BufNewFile,BufRead *.sty  set filetype=plaintex
autocmd BufNewFile,BufRead *.tex  set filetype=tex
autocmd BufNewFile,BufRead *.tikz set filetype=tex
autocmd BufNewFile,BufRead *.tpp  set filetype=cpp
" }}}1

" Options setting {{{1
" Buffer navigation {{{2
set mouse=a
set number
set relativenumber
set scrolloff=5
set splitbelow
set splitright
" }}}2

" Line limits {{{2
set colorcolumn=81
set wrap
set linebreak
set fixeol
" }}}2

" Searching {{{2
set hlsearch
set incsearch
" }}}2

" Tabs {{{2
set noexpandtab
set shiftwidth=3
set softtabstop=0
set tabstop=3
" }}}2

" Other {{{2
set foldmethod=marker
set showcmd
"set t_ut="" " Redraw the whole window every time there's an update
" }}}2
" }}}1

" Plugins {{{1
call plug#begin('~/.vim/plugged')

" Airline {{{2
Plug 'vim-airline/vim-airline'
" Use large separator characters to force an uniform look
let g:airline_powerline_fonts = 1
let g:airline_detect_paste    = 1
" Visual style
let g:airline_left_sep=''
let g:airline_right_sep=''
" Extensions
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
" Symbols redefinition
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
	let g:airline_symbols.notexists = '✘'
	let g:airline_symbols.maxlinenr = ''
endif
" }}}2

" ALE (Asynchronous Lint Engine) {{{2
Plug 'dense-analysis/ale'
" Linters specification
let g:ale_linters = {
	\ 'c': ['gcc'],
	\ 'cpp': ['g++']
	\ }
" Formatting options
let g:ale_change_sign_column_color = 1
let g:ale_sign_error   = ' ✘'
let g:ale_sign_warning = ' ●'
" C specific options
let g:ale_c_cc_options     = '-std=c11 -Wall -Wextra -Wpedantic -Wfloat-equal -Iinclude'
let g:ale_c_parse_makefile = 1
" C++ specific options
let g:ale_cpp_cc_options     = '-std=c++17 -Wall -Wextra -Wpedantic -Wfloat-equal -Iinclude'
let g:ale_cpp_parse_makefile = 1
" Haskell specific options
let g:ale_haskell_ghc_options = '-dynamic'
" Other options
let g:airline#extensions#ale#enabled = 0
" }}}2

" Colorscheme {{{2
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
"}}}2

" Commentary {{{2
Plug 'tpope/vim-commentary'
" }}}2

" EasyAlign {{{2
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}2

" FauxClip {{{2
Plug 'Jorengarenar/fauxClip'
" }}}2

" Fugitive {{{2
Plug 'tpope/vim-fugitive'
" }}}uzc

" Goyo {{{2
Plug 'junegunn/goyo.vim'
map <leader>g :Goyo<CR>
" }}}2

" Limelight {{{2
Plug 'junegunn/limelight.vim'
map <leader>l :Limelight!!<CR>
" Automatically start and end with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}2

" Polyglot {{{2
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['visual-basic']
" C++ options
let g:cpp_class_scope_highlight           = 1
let g:cpp_member_variable_highlight       = 1
let g:cpp_class_decl_highlight            = 1
let g:cpp_posix_standard                  = 1
let g:cpp_experimental_template_highlight = 1 " experimental_simple_template
let g:cpp_concepts_highlight              = 1
" Markdown options
let g:vim_markdown_folding_disabled     = 1
let g:vim_markdown_frontmatter          = 1
let g:vim_markdown_math                 = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_strikethrough        = 1
" }}}2

" Surround {{{2
Plug 'tpope/vim-surround'
" }}}2

" Tagbar "{{{2
Plug 'majutsushi/tagbar'
map <leader>t :TagbarToggle<CR>
" }}}2

" UltiSnips "{{{2
Plug 'sirver/UltiSnips'
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-B>"
let g:UltiSnipsJumpBackwardTrigger = "<C-Z>"
let g:UltiSnipsEditSplit           = "vertical"
" }}}2

" Undotree {{{2
Plug 'mbbill/undotree'
map <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '◯'
let g:undotree_WindowLayout = 2
" }}}2

" VimTeX {{{2
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_compiler_enabled=0
" }}}2

call plug#end() " required
" }}}1

" Commands {{{1
" Translate Markdown bold text to LaTeX textbf
command MDTexBf execute "%s/\\*\\{2\\}\\([^\\*\\{2\\}]\\+\\)\\*\\{2\\}/\\\\textbf{\\1}/g"
" Translate Markdown 1st level titling to LaTeX chapter
command MDTexChapter execute "%s/^# \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\chapter{\\1}/g"
" Translate Markdown inline code to LaTeX style code
command MDTexInlineCodeTt execute "%s/`\\([^`]\\+\\)`/\\\\texttt{\\1}/g"
" Translate Markdown 2nd level titling to LaTeX section
command MDTexSection execute "%s/^## \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\section{\\1}/g"
" Translate Markdown 3rd level titling to LaTeX subsection
command MDTexSubsection execute "%s/^### \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\subsection{\\1}/g"
" }}}1

" Mappings {{{1
" Move through window splits with ^[HJKL] {{{2
imap <silent> <C-K> <Esc>:wincmd k<CR>a
imap <silent> <C-J> <Esc>:wincmd j<CR>a
imap <silent> <C-H> <Esc>:wincmd h<CR>a
imap <silent> <C-L> <Esc>:wincmd l<CR>a
 map <silent> <C-K>      :wincmd k<CR>
 map <silent> <C-J>      :wincmd j<CR>
 map <silent> <C-H>      :wincmd h<CR>
 map <silent> <C-L>      :wincmd l<CR>
" }}}2

" Buffer navigation {{{2
map <silent> <C-N> :bn<CR>
map <silent> <C-P> :bp<CR>
" }}}2

" Miscellaneous {{{2
 noremap <silent> <F3>      :nohl<CR>
inoremap <silent> <F3> <Esc>:nohl<CR>a
" }}}2
" }}}1

" Editor style {{{1
" Highlight text based on code syntax
syntax on
" Colourscheme
if has('nvim') || has('termguicolors')
  set termguicolors
endif
colorscheme challenger_deep
" Show tab characters with low opacity (~20%) comment colour
"Alternative tab character: »
set listchars=tab:>\ ,trail:· list
highlight SpecialKey guifg=#3F3E47
" }}}1
