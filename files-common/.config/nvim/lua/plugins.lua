-- require('bufferline').setup
-- {
-- 	show_tab_indicators    = true,
-- 	always_show_bufferline = true,
-- }

require('colorizer').setup()

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

require('which-key-config')
