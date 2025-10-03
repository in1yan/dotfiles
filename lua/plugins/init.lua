return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "metalelf0/jellybeans-nvim"},
	-- { 'glacambre/firenvim', build = ":call firenvim#install(0)" },
	{"rktjmp/lush.nvim"},
	{ 'wakatime/vim-wakatime', lazy = false },
	"tpope/vim-surround",  -- Surround plugin
	"tpope/vim-commentary",  -- Commentary plugin
	-- "github/copilot.vim",
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	}
}
