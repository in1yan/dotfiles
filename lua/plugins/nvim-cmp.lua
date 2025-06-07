-- Autocomplete plugin
return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',  -- Plugin loaded when insert mode entered
	dependencies = {
		"hrsh7th/cmp-buffer",  -- Completion source for text in current buffer
		"hrsh7th/cmp-path",  -- Completion source for file paths
		"dcampos/nvim-snippy",
		"dcampos/cmp-snippy",

		-- {
		-- 	"L3MON4D3/LuaSnip",  -- Snippet engine for Lua
		-- 	version = "v2.*",  -- Specific version to use
		-- 	build = "make install_jsregexp",  -- Advances snippet matching
		-- },
		-- "saadparwaiz1/cmp_luasnip",  -- Integration between nvim-cmp and LuaSnip
		"rafamadriz/friendly-snippets",  -- Collection of pre-defined snippets
		"onsails/lspkind.nvim",  -- Adds icons to completion items for better visual context
		"hrsh7th/cmp-nvim-lsp",  -- Enables completion from LSP servers
		"hrsh7th/cmp-nvim-lsp-signature-help",  -- Adds signature help (function arguments) in completion popups
	},
	config = function()
		local cmp = require('cmp')
		-- local luasnip = require('luasnip')
		local snippy = require('snippy')
		local lspkind = require('lspkind')

		cmp.setup({
			completion = {
				completeopt = 'menu,menuone,preview',
			},  
			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol', -- show only symbol annotations
					maxwidth = {
						-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- menu = function() return math.floor(0.45 * vim.o.columns) end,
						menu = 50, -- leading text (labelDetails)
						abbr = 50, -- actual suggestion item
					},
					ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function (entry, vim_item)
						-- ...
						return vim_item
					end
				})
			},
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body) 
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
				['<Enter>'] = cmp.mapping.confirm({ select = true }),
			}),
			-- Enable completions from above
			sources = cmp.config.sources({
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'nvim_lsp' },
				{ name = 'snippy' },
				{ name = 'buffer' },
				{ name = 'path' },
			}),
		})

		-- require("luasnip.loaders.from_vscode").lazy_load()  -- Load snippets
	end,
}

