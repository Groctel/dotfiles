local wk = require("which-key")

wk.register({
	b = {
		name = 'Buffer',
		a = {':badd ', 'Add buffer', silent=false},
		d = {'<cmd>bdel<cr>', 'Delete buffer'},
		n = {'<cmd>bnext<cr>', 'Next buffer'},
		p = {'<cmd>bprev<cr>', 'Previous buffer'},
		w = {
			name = '+Write',
			a = {'<cmd>wa<cr>', 'Write all buffers'},
			w = {'<cmd>w<cr>',  'Write current buffer'},
		},
	},

	f = {
		name = '+Files',
		F = {'<cmd>badd $MYVIMRC<cr>', 'Open vimrc file'},
		s = {'<cmd>source $MYVIMRC<cr>', 'Source vimrc file'},
	},

	g = {
		name = '+Git',
		a = {':Git add ', 'git add', silent=false},
		b = {'<cmd>Git blame<cr>', 'git blame'},
		B = {'<cmd>Git branch<cr>', 'git branch'},
		c = {'<cmd>Git commit<cr>', 'git commit'},
		C = {':Git checkout ', 'git checkout', silent=false},
		g = {'<cmd>Neogit kind=split<cr>', 'Neogit split'},
		i = {'<cmd>Git init<cr>', 'git init'},
		l = {'<cmd>Git log<cr>', 'git log'},
		p = {'<cmd>Git push<cr>', 'git push'},
		s = {'<cmd>Git<cr>', 'git status'},
		u = {'<cmd>Git pull<cr>', 'git pull'},
		w = {'<cmd>Git whatchanged<cr>', 'git whatchanged'},
	},

	h = {
		name = '+Help',
		h = {':help ', 'Horizontal help', silent=false},
		v = {':vert help ', 'Vertical help', silent=false},
	},

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
		b = {'<cmd>set nohl<cr>', 'Disable highlight'},
		r = {':%s///g<Left><Left><Left>', 'Search and replace', silent=false},
		s = {'/', 'Search forward', silent=false},
	},

	w = {
		name = '+Window',
		c = {'<C-W>c', 'Close window'},
		r = {'<C-W>r', 'Rotate windows down'},
		R = {'<C-W>R', 'Rotate windows up'},
		s = {'<C-W>s', 'Split horizontally'},
		v = {'<C-W>s', 'Split vertically'},
	},

	[' '] = {':', 'Enter command', silent=false},
}, { prefix = "<leader>" })
