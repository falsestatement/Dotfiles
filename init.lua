vim.cmd("set number relativenumber")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.keymap.set(
	"n",
	"<leader>e",
	':lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})<CR>',
	{ silent = true, noremap = true }
)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "nvimtools/none-ls.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
	},
	{ "tpope/vim-surround" },
}
local opts = {}

require("lazy").setup(plugins, opts)

-- treesitter config
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "typescript", "python", "tsx", "css", "markdown" },
	highlight = { enable = true },
	indent = { enable = true },
})

-- mason config
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver" },
})

-- lspconfig
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

-- none-ls
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- everforest theme
vim.g.everforest_enable_italic = true
vim.g.everforest_background = "soft"
vim.g.everforest_transparent_background = 1
vim.cmd.colorscheme("everforest")
