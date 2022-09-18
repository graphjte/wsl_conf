return require('packer').startup(function(use)

	-- use {'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile',}
	
	use 'wbthomason/packer.nvim'
	
	-- lsp
	use {
		'williamboman/mason.nvim',
    	config = function()
			require('mason').setup()
    	end,
	}

	use {
		'neovim/nvim-lspconfig',
    	config = function()
      		require('config.lsp')
    	end,
	}

	
	use {
	  "ray-x/lsp_signature.nvim",
		config = function()
      		require('config.lsp_signature')
    	end,
	
	}

	-- cmp
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			{
				"L3MON4D3/LuaSnip",
				requires = { "rafamadriz/friendly-snippets" },
				config = function()
					require('config.luasnip')
				end,
			},
			{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
			{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
		},
		config = function()
      		require('config.cmp')
    	end,
		event = 'InsertEnter *',
	}

	use {
		"jose-elias-alvarez/null-ls.nvim",
		-- after = 'nvim-cmp',
		config = function()
			require('config.null-ls')
		end,
	}

	use {
		"MunifTanjim/prettier.nvim",
		-- after = 'nvim-cmp',
		config = function()
			require('config.prettier')
		end,
	}

	-- use { 'tpope/vim-surround' }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

	use { 
		"windwp/nvim-ts-autotag", 
		-- event = "InsertEnter",
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	}

	use {
		"windwp/nvim-autopairs",
		-- after = 'nvim-cmp',
		config = function()
			require('config.autopairs')
		end,
	}

	use 'folke/tokyonight.nvim'
	
	use 'lewis6991/impatient.nvim'
	
	use 'mhinz/vim-startify'
	
	use 'tpope/vim-sleuth'

    use "lukas-reineke/indent-blankline.nvim"
	
	use {'dracula/vim', as = 'dracula'}

	use {
		'navarasu/onedark.nvim',
		config = function()
			require('config.onedark')
		end,
	}
	
	use "rebelot/kanagawa.nvim"

	use({
		'projekt0n/github-nvim-theme',
		config = function()
			require('github-theme').setup({
				-- ...
			})
		end
	})
	
	use { 
		'nvim-treesitter/nvim-treesitter', 
		run = ':TSUpdate',
		config = function()
			require('config.treesitter')
		end,
	}
	
	use {
		"SmiteshP/nvim-gps",
		-- requires = "nvim-treesitter/nvim-treesitter"
	}

	use {
	    'numToStr/Comment.nvim',
	    config = function()
			require('Comment').setup()
	    end
	}
	
	use {
	    'norcalli/nvim-colorizer.lua',
	    config = function()
			require('colorizer').setup()
	    end
	}

	use {
		'nvim-telescope/telescope.nvim', 
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require('config.telescope')
		end,
	}

	use {
		'kyazdani42/nvim-tree.lua',
	  	requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
	  	},
	  	config = function()
      		require('config.nvim-tree')
    	end,
	}
  	
  	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  	    config = function()
      		require('config.lualine')
	    end
	}
	
	use {
	  "folke/trouble.nvim",
	  requires = "kyazdani42/nvim-web-devicons",
	  	config = function()
      		require('config.trouble')
    	end,
	}
	-- use {
 --    	'akinsho/bufferline.nvim',
 --    	config = function()
 --      		require('config.bufferline')
 --    	end,
 --  	}
	
	
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use 'lervag/vimtex'
end)

