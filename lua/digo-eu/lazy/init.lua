return {
	{
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		config = function()
			vim.opt.termguicolors = true
			vim.cmd.colorscheme('tokyonight')
		end
	},
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter'
    },
	{
		"nvim-lua/plenary.nvim",
		name = 'plenary',
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { "plenary" }
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {}
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "plenary" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end, desc = "harpoon file", },
			{ "<leader>e", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },

			{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
			{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
			{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
			{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
			{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
		},
	},
	"github/copilot.vim",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"j-hui/fidget.nvim",
		},

		config = function()
			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function (server_name)
						require("lspconfig")[server_name].setup {
							on_attach = attach
						}
					end
				}
			})
			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}
		end
	},
}
