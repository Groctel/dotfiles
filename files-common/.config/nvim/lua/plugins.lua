require('colorizer').setup()

require('compe').setup{
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
		ultisnips = true;
		luasnip = true;
	};
}

require('lspconfig').clangd.setup{}
require('lspconfig').intelephense.setup{}
require('lspconfig').jsonls.setup{
	cmd = { "vscode-json-languageserver", "--stdio" }
}
require('lspconfig').pyright.setup{}
require('lspconfig').solargraph.setup{}
require('lspconfig').texlab.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').vimls.setup{}

require('neogit').setup{}
require('neonline')

require('nvim-treesitter.configs').setup
{
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

require('orgmode').setup({
	org_agenda_files = {'~/.config/nvim/org-files/**/*'},
	org_default_notes_file = '~/.config/nvim/org-files/refile.org',
	mappings = { global = {
		org_agenda = 'gA',
		org_capture = 'gC'
	} },
})

require('telescope').setup{
	-- find_files({hidden=true})
}

require('todo-comments').setup {}

require('which-key-config')
