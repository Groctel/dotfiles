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

autocmd BufWritePre * silent! undojoin | %s/\s\+$//e | %s/\(\n\r\?\)\+\%$//e
filetype plugin indent on " Required by plugins
let mapleader = ","

" }}}1

" Custom filetypes {{{1

autocmd BufNewFile,BufRead *.tex  set filetype=tex
autocmd BufNewFile,BufRead *.tikz set filetype=tex
autocmd BufNewFile,BufRead *.tpp  set filetype=cpp

" }}}1

" Native variables {{{1
" ---------------------
" Settings for variables native to vim.
"
set cc=81                 " Vertical bar which you shall not pass
set foldmethod=marker     " Fold text based on markers by default
set hlsearch              " Highlight all matching strings after a search
set number relativenumber " Show relative and current number lines
set shiftwidth=0          " Use the value of tabstop (=0)
set softtabstop=-1        " Use the value of shiftwidth (<0)
set splitbelow splitright " Split windows below or to the right
set t_ut=""               " Constantly redraw vim to keep background colour
set tabstop=3             " Hard tabs represent 3 spaces for me, not sorry
set wrap linebreak        " Lines break on window border

" }}}1

" Plugins {{{1
" ------------
" Vim-Plug is my plugin loader of choice.
" All plugins are loaded from here with their corresponding options.

" Required Vundle settings
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Airline {{{2
" ------------
" The airline is the bar that is shown at the bottom of the screen. It shows
" information about the active document's current status.

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Use large separator characters to force an uniform look
let g:airline_left_sep        = ''
let g:airline_left_alt_sep    = ''
let g:airline_right_sep       = ''
let g:airline_right_alt_sep   = ''
let g:airline_powerline_fonts = 1
let g:airline_detect_paste    = 1

" Extensions
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" Symbols redefinition
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
	let g:airline_symbols.notexists = '✘'
endif

" }}}2

" ALE (Asynchronous Lint Engine) {{{2
Plug 'dense-analysis/ale'
let g:ale_linters = {'c': ['gcc'],
\                    'cpp': ['gcc']
\                   }
let g:ale_c_gcc_options      = '-std=c11 -Wall -Iinclude'
let g:ale_cpp_gcc_options    = '-std=c++11 -Wall -Iinclude'
let g:ale_sign_error         = '=>'
let g:ale_sign_warning       = '->'
let g:ale_c_parse_makefile   = 1
let g:ale_cpp_parse_makefile = 1

" }}}2

" Challenger Deep {{{2
" ====================
" Challenger Deep is my colourscheme of choice. It loads later in the script
" as an actual colorscheme, but is sourced here.
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

"}}}2

" Fugitive {{{2
Plug 'tpope/vim-fugitive'

" }}}2

" Goyo {{{2
" ---------
" Goyo removes all superfluous information from the screen and centers the
" text to free the writer from distractions. It's integrated with LimeLight to
" offer an improved experience.
Plug 'junegunn/goyo.vim'

map <leader>g :Goyo<CR>

" }}}2

" Limelight {{{2
" --------------
" Limelight turns colours off in uncofused paragraphs so that the writer isn't
" distracted by the context's syntax. It's integrated with Goyo to turn on and
" off along with it.
Plug 'junegunn/limelight.vim'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
map <leader>l :Limelight!!<CR>

" }}}2

" Markdown syntax {{{2
" --------------------
" Show syntax highlighting in Markdown files.
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_strikethrough = 1

" }}}2

" NERDTree {{{2
" -------------
" NERDTree shows a directory tree at the left side of the screen, making the
" navigation through the project much easier.
Plug 'scrooloose/nerdtree'

map <leader>n :NERDTreeToggle<CR>

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
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-B>"
let g:UltiSnipsJumpBackwardTrigger = "<C-Z>"
let g:UltiSnipsEditSplit           = "vertical"

" }}}2

" Undotree {{{2
" -------------
" Undotree displays a tree of the document's writing history at the left side
" of the screen using a tree data structure, so that branching undos can be
" accessed and they're not lost.
Plug 'mbbill/undotree'

map <leader>u :UndotreeToggle<CR>

" }}}2

" All of your Plugs must be added before the following line
call plug#end() " required

" }}}1

" Commands {{{1
" -------------
" Commands defined by me to automate various tasks.

" Translate Markdown bold text to LaTeX textbf
command MDTexBf execute "%s/\\*\\{2\\}\\([^\\*\\{2\\}]\\+\\)\\*\\{2\\}/\\\\textbf{\\1}/g"
" Translate Markdown 1st level titling to LaTeX chapter
command MDTexChapter execute "%s/^# \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\chapter{\\1}/g"
" Translate Markdown inline code to LaTeX style code
command MDTexInlineCode execute "%s/`\\([^`]\\+\\)`/\\\\code{\\1}/g"
" Translate Markdown inline code to LaTeX style code using texttt
command MDTexInlineCodeTTT execute "%s/`\\([^`]\\+\\)`/\\\\texttt{\\1}/g"
" Translate Markdown 2nd level titling to LaTeX section
command MDTexSection execute "%s/^## \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\section{\\1}/g"
" Translate Markdown 3rd level titling to LaTeX subsection
command MDTexSubsection execute "%s/^### \\+[^-a-zA-Z]*-\\? *\\(.\\+\\)$/\\\\subsection{\\1}/g"

" }}}1

" Mappings {{{1
" -------------
" Custom key mappings to make the use of Vim much more comfortable.

" Move through window splits with ^[HJKL] {{{2
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

" }}}2

" }}}1

" Editor style {{{1
" -----------------
" Stilisation settings for the text window only.

" Highlight text based on code syntax
syntax enable

" Colourscheme

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep

" Show tab characters with low opacity (~20%) comment colour
set listchars=tab:>\  list "Alternative character: »
highlight SpecialKey guifg=#3F3E47

" }}}1
