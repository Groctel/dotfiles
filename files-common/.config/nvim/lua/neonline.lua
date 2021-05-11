local gl  = require('galaxyline')
local gls = gl.section

local buffer    = require('galaxyline.provider_buffer')
local colors    = require("tokyonight.colors").setup(config)
local condition = require('galaxyline.condition')
local fileinfo  = require('galaxyline.provider_fileinfo')
local lsp       = require('galaxyline.provider_lsp')
local vcs       = require('galaxyline.provider_vcs')

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

-- Maps {{{1
local mode_color = { -- {{{2
	c  = colors.magenta, ['!'] = colors.red,
	i  = colors.green,   ic    = colors.yellow, ix     = colors.yellow,
	n  = colors.blue,
	no = colors.blue,    nov   = colors.blue,   noV    = colors.blue,
	r  = colors.cyan,    rm    = colors.cyan,   ['r?'] = colors.cyan,
	R  = colors.purple,  Rv    = colors.purple,
	s  = colors.orange,  S     = colors.orange, [''] = colors.orange,
	t  = colors.purple,
	v  = colors.red,     V     = colors.red,    [''] = colors.red,
}
-- }}}2

local mode_icon = { --- {{{2
	c = "🅒 ", ['!'] = "🅒 ",
	i = "🅘 ", ic    = "🅘 ", ix     = "🅘 ",
	n = "🅝 ",
	R = "🅡 ", Rv    = "🅡 ",
	r = "🅡 ", rm    = "🅡 ", ['r?'] = "🅡 ",
	s = "🅢 ", S     = "🅢 ", [''] = "🅢 ",
	t = "🅣 ",
	v = "🅥 ", V     = "🅥 ", [''] = "🅥 ",
}
-- }}}2

local num_icons = {"➊ ", "❷ ", "➌ ", "➍ ", "➎ ", "➏ ", "➐ ", "➑ ", "➒ ", " "}
-- }}}1

-- Left hand side modules {{{1
gls.left[0] = { Left = { -- {{{2
	highlight = {colors.blue, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command('hi GalaxyLeft guifg='..mode_color[vim.fn.mode()])
		return "█"
	end,
}}
-- }}}2

gls.left[1] = { ModeNum = { -- {{{2
	highlight = {colors.black, colors.bg_statusline, 'bold'},

	provider = function ()
		vim.api.nvim_command('hi GalaxyModeNum guibg='..mode_color[vim.fn.mode()])
		return
			mode_icon[vim.fn.mode()]..
			num_icons[math.min(10, buffer.get_buffer_number())]
	end,
}}
-- }}}2

gls.left[2] = { BufSep = { -- {{{2
	highlight = {colors.bg_statusline, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command("hi GalaxyBufSep guibg="..mode_color[vim.fn.mode()])
		return "█"
	end,
}}
-- }}}2

gls.left[3] = { FileIcon = { -- {{{2
	condition = condition.buffer_not_empty,
	highlight = {fileinfo.get_file_icon_color, colors.bg_statusline},
	provider  = 'FileIcon',
}}
-- }}}2

gls.left[4] = { FileName = { -- {{{2
	condition = condition.buffer_not_empty,
	highlight = {colors.white, colors.bg_statusline, 'bold'},
	provider  = 'FileName',
}}
-- }}}2

gls.left[5] = { FileSep = { -- {{{2
	highlight = {colors.bg_statusline, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command('hi GalaxyFileSep guibg='..mode_color[vim.fn.mode()])
		return " "
	end,
}}
-- }}}2

gls.left[6] = { FileEF = { -- {{{2
	highlight = {colors.black, colors.bg_statusline, 'bold'},

	provider = function ()
		local format_icon = {['DOS'] = " ", ['MAC'] = " ", ['UNIX'] = " "}
		local encode      = fileinfo.get_file_encode()
		local format      = fileinfo.get_file_format()

		vim.api.nvim_command('hi GalaxyFileEF guibg='..mode_color[vim.fn.mode()])
		return encode..' '..format_icon[format]
	end,
}}
-- }}}2

gls.left[7] = { EFSep = { -- {{{2
	highlight = {colors.bg_statusline, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command('hi GalaxyEFSep guibg='..mode_color[vim.fn.mode()])
		return "█"
	end,
}}
-- }}}2

gls.left[8] = { Git = { -- {{{2
	condition = condition.check_git_workspace,
	highlight = {colors.blue, colors.bg_statusline, 'bold'},

	provider = function ()
		vim.api.nvim_command('hi GalaxyGit guifg='..mode_color[vim.fn.mode()])
		return ' '..vcs.get_git_branch()..' '
	end,
}}
-- }}}2

gls.left[9] = { DiagnosticError = { -- {{{2
	icon      = ' ',
	highlight = {colors.red,colors.bg},
	provider  = 'DiagnosticError',
}}
-- }}}2

gls.left[10] = { DiagnosticWarn = { -- {{{2
	highlight = {colors.yellow,colors.bg},
	icon      = ' ',
	provider  = 'DiagnosticWarn',
}}
-- }}}2

gls.left[11] = { DiagnosticHint = { -- {{{2
	highlight = {colors.cyan,colors.bg},
	icon      = ' ',
	provider  = 'DiagnosticHint',
}}
-- }}}2

gls.left[12] = { DiagnosticInfo = { -- {{{2
	highlight = {colors.blue,colors.bg},
	icon      = ' ',
	provider  = 'DiagnosticInfo',
}}
-- }}}2
-- }}}1

-- Centered modules {{{1
gls.mid[0] = { Empty = {
	highlight = {colors.fg, colors.bg_statusline},
	provider  = function () return end,
}}
-- }}}1

-- Right hand side modules {{{1
gls.right[0] = { LspClient = { -- {{{2
	condition = function ()
		local tbl = {['dashboard'] = true, [''] = true}
		if tbl[vim.bo.filetype] then return false end
		return true
	end,

	highlight = {colors.fg, colors.bg_statusline, 'bold'},

	provider = function ()
		local icon = ' '
		local active_lsp = lsp.get_lsp_client()

		if active_lsp == 'No Active Lsp' then
			icon = ''
			active_lsp  = ''
		end

		vim.api.nvim_command('hi GalaxyLspClient guifg='..mode_color[vim.fn.mode()])
		return icon..active_lsp
	end,
}}
-- }}}2

gls.right[1] = { LineSep = { -- {{{2
	highlight = {colors.bg_statusline, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command('hi GalaxyLineSep guibg='..mode_color[vim.fn.mode()])
		return " "
	end,
}}
-- }}}2

gls.right[2] = { LineInfo = { -- {{{2
	highlight = {colors.black, colors.bg_statusline, 'bold'},

	provider = function ()
		local cursor = vim.api.nvim_win_get_cursor(0)

		vim.api.nvim_command('hi GalaxyLineInfo guibg='..mode_color[vim.fn.mode()])
		return '☰ '..cursor[1]..'/'..vim.api.nvim_buf_line_count(0)..':'..cursor[2]
	end,
}}
-- }}}2

gls.right[3] = { Right = { -- {{{2
	highlight = {colors.blue, colors.bg_statusline},

	provider = function ()
		vim.api.nvim_command('hi GalaxyRight guifg='..mode_color[vim.fn.mode()])
		return '█'
	end,
}}
-- }}}2
-- }}}1

-- Short line modules {{{1
gls.short_line_left[1] = { BufferType = { -- {{{2
	highlight           = {colors.blue,colors.bg,'bold'},
	provider            = 'FileTypeName',
	separator           = ' ',
	separator_highlight = {'NONE',colors.bg},
}}
-- }}}2

gls.short_line_left[2] = { SFileName = { -- {{{2
	condition = condition.buffer_not_empty,
	highlight = {colors.fg,colors.bg,'bold'},
	provider  = 'SFileName',
}}
-- }}}2

gls.short_line_right[1] = { BufferIcon = { -- {{{2
	highlight = {colors.fg,colors.bg},
	provider  = 'BufferIcon',
}}
-- }}}2
-- }}}1
