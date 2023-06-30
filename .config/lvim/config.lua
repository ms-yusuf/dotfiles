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

lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git = { staged = "✓", untracked = "★" }

lvim.plugins = {
	{
		"EdenEast/nightfox.nvim",
		"chentoast/marks.nvim",
		"f-person/git-blame.nvim",
		"fatih/vim-go",
		"folke/trouble.nvim",
		"gennaro-tedesco/nvim-peekup",
		"luukvbaal/statuscol.nvim",
		"nacro90/numb.nvim",
		"phaazon/hop.nvim",
		"preservim/tagbar",
		"rmagatti/auto-session",
		"romainl/vim-cool",
		"sindrets/diffview.nvim",
		"sitiom/nvim-numbertoggle",
		"tpope/vim-commentary",
		"tpope/vim-surround",
		"vim-scripts/SmartCase"
	},
}

-- general
lvim.log.level = "info"
lvim.transparent_window = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<F2>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<F3>"] = ":NvimTreeFindFileToggle<CR>"
lvim.keys.normal_mode["<F4>"] = ":TagbarToggle<CR>"
lvim.keys.normal_mode["<F5>"] = ":GitBlameToggle<CR>"
lvim.keys.normal_mode["<C-k>"] = ":Commentary<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<C-s>"] = ":HopWord<CR>"

-- -- Change theme settings
lvim.colorscheme = "carbonfox"

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
		-- filetypes = { "typescript", "typescriptreact" },
	},
	{ command = "goimports", filetypes = { "go" } },
	{ command = "gofumpt", filetypes = { "go" } },
	{ command = "blade_formatter", filetype = { "php", "blade", "blade.php" } },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
}

require("auto-session").setup {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
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
-- require('gitsigns').setup()
require('trouble').setup()
-- require('nvim-tree').setup({ 
-- 	view = { 
-- 		relativenumber = true,
-- 		width = 30
-- 	},
-- 	filters = {
-- 		dotfiles = true
-- 	}
-- })

vim.g.gitblame_enabled = 1

-- -- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})

lvim.builtin.treesitter.ensure_installed = {
	"javascript",
	"typescript",
	"php",
	"css",
	"json",
	"bash",
	"go",
	"gomod",
}

lvim.format_on_save.enabled = true
lvim.format_on_save = {
	pattern = { "*.go", "*.php", "*.js", "*.ts", "*.svelte", "*.html", "*.md" },
}


-- todo
-- olexsmir/gopher.nvim
-- leoluz/nvim-dap-go
--

lvim.lsp.installer.setup.ensure_installed = {
	"sumneko_lua",
	"jsonls",
	"html",
	"cssls",
	"emmet_ls",
	"tsserver",
	"intelephense",
	"tailwindcss",
	"gopls",
	"typescript-language-server",
	"docker-compose-language-server",
	"dockerfile-language-server",
	"nginx-language-server",
	"svelte-language-server",
}

require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("tailwindcss")
require("lvim.lsp.manager").setup("intelephense")
require("lvim.lsp.manager").setup("svelte-language-server")
require("lvim.lsp.manager").setup("gopls")
