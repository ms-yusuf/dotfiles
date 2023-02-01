-- -- vim options
-- indentation
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.wrap = false
-- line number
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
-- clipboard
vim.opt.clipboard = "unnamedplus"
-- search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- others
vim.opt.hidden = true
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}
lvim.transparent_window = true

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<F2>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<F3>"] = ":NvimTreeFindFileToggle<cr>"
lvim.keys.normal_mode["<F4>"] = ":TagbarToggle<cr>"
lvim.keys.normal_mode["<F5>"] = ":GitBlameToggle<cr>"
lvim.keys.normal_mode["<C-k>"] = ":Commentary<cr>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode["<C-w>"] = ":HopWord<cr>"

-- -- Change theme settings
lvim.colorscheme = "carbonfox"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.lualine.style = "lvim"


-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
}

lvim.plugins = {
	{
		"EdenEast/nightfox.nvim",
		"romainl/vim-cool",
		"preservim/tagbar",
		"tpope/vim-surround",
		"tpope/vim-commentary",
		"Yggdroot/indentLine",
		"gennaro-tedesco/nvim-peekup",
		"chentoast/marks.nvim",
		"phaazon/hop.nvim",
		"nacro90/numb.nvim",
		"f-person/git-blame.nvim",
		"lewis6991/gitsigns.nvim",
		"sindrets/diffview.nvim",
		"luukvbaal/statuscol.nvim",
		"sitiom/nvim-numbertoggle",
		"folke/trouble.nvim",
		-- cmd = "TroubleToggle",
	},
}

require 'hop'.setup()
require('numb').setup {
	show_numbers = true,
	show_cursorline = true,
	hide_relativenumbers = true,
	number_only = false,
	centered_peeking = true,
}
require("statuscol").setup {
	setopt = true,
}
require('gitsigns').setup()
require('trouble').setup()
vim.g.gitblame_enabled = 0

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})


-- -- todo
-- number toggle on insert (nonrelative) and normal mode (relative number)
