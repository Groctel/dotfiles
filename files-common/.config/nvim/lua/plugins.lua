require('bufferline').setup
{
	show_tab_indicators    = true,
	always_show_bufferline = true,
}

require('colorizer').setup()

require('lspconfig').bashls.setup{}
require('lspconfig').ccls.setup{ root_dir = dirname }
require('lspconfig').cssls.setup{}
require('lspconfig').intelephense.setup{}
require('lspconfig').jsonls.setup{}
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

require('which-key-config')