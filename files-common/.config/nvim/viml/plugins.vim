" Autoinstall vim-plug on first run
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | qa!
endif

let loaded_netrwPlugin = 1 " I can't close netrw :(

call plug#begin('~/.config/nvim/plugged')
	" Plug 'justinmk/vim-sneak'
	" Plug 'liuchengxu/vista.vim'
	" Plug 'nvim-lua/completion-nvim'
		" set completeopt=menuone,noinsert,noselect

	Plug 'junegunn/vim-plug'
	Plug 'machakann/vim-highlightedyank'
	Plug 'majutsushi/tagbar'
	Plug 'neovim/nvim-lspconfig'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-surround'
	Plug 'voldikss/vim-floaterm'

	Plug 'andweeb/presence.nvim'
		let g:presence_auto_update       = 1
		let g:presence_neovim_image_text = "github.com/groctel/dotfiles"

	Plug 'dense-analysis/ale'
		let g:ale_linters = {
			\ 'c': [],
			\ 'cpp': [],
			\ 'java': [],
			\ 'javascript': ['eslint'],
			\ 'ruby': []
		\}
		let g:ale_change_sign_column_color = 1
		let g:ale_sign_error               = ' ✘'
		let g:ale_sign_warning             = ' ●'

	Plug 'folke/tokyonight.nvim'
		let g:tokyonight_style = "night"

	Plug 'glepnir/dashboard-nvim'
		runtime viml/dashboard-splash.vim
		let g:dashboard_custom_section = {
			\ 'row0': {
				\ 'description': [' New file                               SPC f n'],
				\ 'command': 'enew'
			\},
			\ 'row1': {
				\ 'description': [' Find file                              SPC f f'],
				\ 'command': 'Telescope find_files'
			\},
			\ 'row2': {
				\ 'description': [' Open vimrc                       SPC f SPC SPC'],
				\ 'command': 'badd $MYVIMRC | bnext'
			\},
			\ 'row3': {
				\ 'description': ['ﮮ Update plugins                     SPC f SPC u'],
				\ 'command': 'source $MYVIMRC | PlugUpdate'
			\},
			\ 'row4': {
				\ 'description': [' Open floating terminal                 SPC T T'],
				\ 'command': 'FloatermToggle'
			\},
			\ 'row5': {
				\ 'description': [' Close neovim                           SPC q q'],
				\ 'command': 'qa!'
			\},
		\}

		augroup Dashboard
			autocmd!
			autocmd FileType dashboard setlocal laststatus=0 noruler
		augroup END

	Plug 'jbyuki/instant.nvim'
		" Run `ngrok http <port>` (for example port 8080) and get the forwarding
		" address minus https://. Use it in `:InstantStartServer <address> <port>`
		let g:instant_username = "Groctel"

	Plug 'junegunn/goyo.vim'
		Plug 'junegunn/limelight.vim'
		augroup Goyo
			autocmd!
			autocmd User GoyoEnter Limelight
			autocmd User GoyoLeave Limelight!
		augroup END

	Plug 'junegunn/vim-easy-align'
		xmap ga <Plug>(EasyAlign)
		nmap ga <Plug>(EasyAlign)

	Plug 'lervag/vimtex'
		let g:tex_flavor              = 'latex'
		let g:vimtex_compiler_enabled = 0

		let g:vimtex_indent_enabled      = 0
		let g:vimtex_indent_bib_enabled  = 0
		let g:vimtex_indent_conditionals = {}
		let g:vimtex_indent_delims       = {}
		let g:vimtex_indent_lists        = []

	Plug 'mattn/emmet-vim'
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

	Plug 'tpope/vim-commentary'
		augroup CommentStrings
			autocmd!
			autocmd FileType inform setlocal commentstring=!\ %s
		augroup END

	Plug 'mbbill/undotree'
		let g:undotree_SetFocusWhenToggle = 1
		let g:undotree_ShortIndicators    = 1
		let g:undotree_TreeNodeShape      = '◯'
		let g:undotree_WindowLayout       = 2

	Plug 'romgrk/barbar.nvim'
		let bufferline = get(g:, 'bufferline', {})
		let g:bufferline.no_name_title = '[Empty buffer]'

	Plug 'sirver/UltiSnips'
		let g:UltiSnipsExpandTrigger       = "<Tab>"
		let g:UltiSnipsJumpForwardTrigger  = "<C-B>"
		let g:UltiSnipsJumpBackwardTrigger = "<C-Z>"
		let g:UltiSnipsEditSplit           = "vertical"

	" Lua plugins
	Plug 'TimUntersberger/neogit'
	Plug 'folke/trouble.nvim'
	Plug 'folke/which-key.nvim'
	Plug 'glepnir/galaxyline.nvim'
	Plug 'hrsh7th/nvim-compe'
	Plug 'kristijanhusak/orgmode.nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'
	Plug 'onsails/lspkind-nvim'
	Plug 'tversteeg/registers.nvim'
call plug#end()

lua require('plugins')
