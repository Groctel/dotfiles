local wk = require('which-key')

wk.setup {
	triggers = '<leader>'
}

local luaplg = '~/.config/nvim/lua/plugins.lua'
local neonln = '~/.config/nvim/lua/neonline.lua'
local plugin = '~/.config/nvim/viml/plugins.vim'
local splash = '~/.config/nvim/viml/dashboard-splash-strings.txt'
local option = '~/.config/nvim/viml/options.vim'
local wkconf = '~/.config/nvim/lua/which-key-config.lua'

function compile_command (system)
	local systems = {
		['latex'] = 'pdflatex',
	}
	vim.fn.execute('!'..systems[system]..' '..vim.fn.execute('echo bufname()'):sub(2))
end

key_tree = {
	b = {
		name = '+Buffer',
		a = {':badd ', 'Add buffer', silent=false},
		d = {'<cmd>bdel<cr>', 'Delete buffer'},
		c = {'<cmd>BufferClose<cr>', 'Close buffer'},
		n = {'<cmd>BufferNext<cr>', 'Next buffer'},
		p = {'<cmd>BufferPrevious<cr>', 'Previous buffer'},
		w = {'<cmd>w<cr>', 'Write current buffer'},
		W = {'<cmd>wa<cr>', 'Write all buffers'},
		['>'] = {'<cmd>BufferMoveNext<cr>', 'Move buffer to the right'},
		['<'] = {'<cmd>BufferMovePrevious<cr>', 'Move buffer to the left'},
		[' '] = {'<cmd>Telescope buffers<cr>', 'List open buffers'},
	},

	c = {
		name = '+Compilation',
		l = {'<cmd>lua compile_command("latex")<cr>', 'LaTeX'},
	},

	f = {
		name = '+Files',
		f = {'<cmd>Telescope find_files<cr>', 'Find file'},
		n = {'<cmd>enew<cr>', 'New file'},
		t = {'<cmd>NvimTreeToggle<cr>', 'Toggle file tree'},
		[' '] = {
			name = '+Dotfiles',
			l = {'<cmd>badd '..luaplg..'| blast<cr>', 'Open lua plugins settings'},
			n = {'<cmd>badd '..neonln..'| blast<cr>', 'Open neonline settings'},
			o = {'<cmd>badd '..option..'| blast<cr>', 'Open options settings'},
			p = {'<cmd>badd '..plugin..'| blast<cr>', 'Open plugins settings'},
			s = {'<cmd>badd '..splash..'| blast<cr>', 'Open splash strings file'},
			S = {'<cmd>source $MYVIMRC | blast<cr>', 'Source vimrc'},
			w = {'<cmd>badd '..wkconf..'| blast<cr>', 'Open which-key settings'},
			[' '] = {'<cmd>badd $MYVIMRC | blast<cr>', 'Open vimrc'},
		},
	},

	g = {
		name = '+Git',
		a = {':Git add ', 'git add', silent=false},
		b = {'<cmd>Git blame<cr>', 'git blame'},
		B = {'<cmd>Telescope git_branches<cr>', 'git branch'},
		c = {
			name = 'Commits',
			b = {'<cmd>Telescope git_bcommits<cr>', 'Buffer local commits'},
			c = {'<cmd>Git commit<cr>', 'git commit'},
			C = {'<cmd>Telescope git_commits<cr>', 'Commits history'},
		},
		C = {':Git checkout ', 'git checkout', silent=false},
		g = {'<cmd>Neogit kind=split<cr>', 'Neogit split'},
		f = {'<cmd>Telescope git_files<cr>', 'Inspect files'},
		i = {'<cmd>Git init<cr>', 'git init'},
		l = {'<cmd>Git log<cr>', 'git log'},
		p = {'<cmd>Git push<cr>', 'git push'},
		s = {'<cmd>Git<cr>', 'git status'},
		S = {'<cmd>Telescope git_stash<cr>', 'git stash'},
		u = {'<cmd>Git pull<cr>', 'git pull'},
		w = {'<cmd>Git whatchanged<cr>', 'git whatchanged'},
	},

	h = {
		name = '+Help',
		h = {':help ', 'Horizontal help', silent=false},
		v = {':vert help ', 'Vertical help', silent=false},
	},

	j = {
		name = '+Jump to...',
		d = {'<cmd>Telescope lsp_definitions<cr>', 'Definition'},
	},

	l = {
		name = '+LSP',
		a = {
			name = '+ALE',
			d = {'<cmd>ALEDetail<cr>', 'Marker detail'},
			i = {'<cmd>ALEInfo<cr>', 'Linter info'},
		},
		i = {'<cmd>LspInfo<cr>', 'Info'},
		r = {'<cmd>LspRestart<cr>', 'Restart'},
		s = {'<cmd>LspStart<cr>', 'Start'},
		S = {'<cmd>LspStop<cr>', 'Stop'},
		t = {'<cmd>TroubleToggle<cr>', 'Trouble'},
	},

	-- o = {
	-- 	name = '+Org Mode',
	-- 	a = {'<cmd>lua require("orgmode").action("agenda.prompt")<CR>', 'Agenda'},
	-- 	c = {'<cmd>lua require("orgmode").action("capture.prompt")<CR>', 'Capture'},
	-- },

	p = {
		name = '+Plugins',
		g = {'<cmd>Goyo<cr>', 'Goyo'},
		t = {'<cmd>TagbarToggle<cr>', 'Tagbar'},
		u = {'<cmd>UndotreeToggle<cr>', 'UndoTree'},
		[' '] = {
			name = '+Settings',
			c = {'<cmd>source $MYVIMRC | PlugClean<cr>', 'Clean plugins'},
			d = {'<cmd>PlugDiff<cr>', 'Show diff'},
			i = {'PlugInstall ', 'Install a plugin', silent=false},
			s = {'<cmd>PlugStatus<cr>', 'Show status'},
			S = {'<cmd>PlugSnapshot<cr>', 'Save plugins snapshot'},
			u = {'<cmd>source $MYVIMRC | PlugUpdate<cr>', 'Update plugins'},
			U = {'<cmd>PlugUpgrade<cr>', 'Update vim-plug'},
		}
	},

	q = {
		name = '+Quit',
		q = {'<cmd>qa<cr>', 'Quit Vim'},
		Q = {'<cmd>qa!<cr>', 'Force quit Vim'},
		w = {'<cmd>wqa<cr>', 'Write-quit Vim'},
		W = {'<cmd>wqa!<cr>', 'Force write-quit Vim'},
	},

	s = {
		name = '+Search',
		b = {'?', 'Search backward', silent=false},
		g = {'<cmd>Telescope grep_string<cr>', 'Grep string under cursor'},
		G = {'<cmd>Telescope live_grep<cr>', 'Grep arbitrary string'},
		h = {'<cmd>nohl<cr>', 'Disable highlight'},
		r = {':%s///g<Left><Left><Left>', 'Search and replace', silent=false},
		s = {'/', 'Search forward', silent=false},
		t = {'<cmd>TodoTelescope<cr>', 'TODO appearances'},
	},

	t = {
		name = '+Tabs',
		c = {'<cmd>tabclose<cr>', 'Close tab'},
		f = {'<cmd>tabfirst<cr>', 'First tab'},
		l = {'<cmd>tablast<cr>', 'Last tab'},
		n = {'<cmd>tabnext<cr>', 'Next tab'},
		p = {'<cmd>tabprevious<cr>', 'Previous tab'},
		t = {'<cmd>tabnew<cr>', 'New Tab'},
	},

	T = {
		name = '+Terminal',
		t = {'<cmd>term<cr>', 'Open terminal in buffer'},
		T = {'<cmd>FloatermToggle<cr>', 'Open floating terminal'},
		h = {'<cmd>split | term<cr>', 'Split to terminal'},
		v = {'<cmd>vsplit | term<cr>', 'Vsplit to terminal'},
	},

	v = {
		name = '+Vim/Neovim',
		c = {'<cmd>checkhealth<cr>', 'Check nvim health'},
	},

	w = {
		name = '+Window',
		c = {'<C-W>c', 'Close window'},
		h = {'<C-W>h', 'Switch left'},
		j = {'<C-W>j', 'Switch down'},
		k = {'<C-W>k', 'Switch up'},
		l = {'<C-W>l', 'Switch right'},
		r = {'<C-W>r', 'Rotate windows down'},
		R = {'<C-W>R', 'Rotate windows up'},
		s = {'<C-W>s', 'Split horizontally'},
		v = {'<C-W>v', 'Split vertically'},
		w = {'<C-W>w', 'Next window'},
	},

	[' '] = {':', 'Enter command', silent=false},
	['<CR>'] = {':!', 'Enter system command', silent=false},
	['-'] = {'<cmd>Telescope command_history<cr>', 'Command history'},
}

for i = 1, 8 do
	local number = tostring(i)
	key_tree['j'][number] = {'<cmd>BufferGoto '..number..'<cr>', 'Buffer '..number}
end

wk.register(key_tree, {prefix = '<leader>'})
