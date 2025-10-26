-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rebelot/kanagawa.nvim',
	  as = 'kanagawa',
	  config = function()
		  vim.cmd('colorscheme kanagawa')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use 'mbbill/undotree'
  use 'numToStr/Comment.nvim'

  use {
		  'lukas-reineke/indent-blankline.nvim',
		  config = function()
				  require('ibl').setup {
						  -- This is the table for general indent line settings
						  indent = {
								  -- Correct key for the line character
								  char = "│", 

								  -- Optional: You can specify characters for alternating levels
								  -- char_list = { "│", "┆" },
						  },

						  -- Other common global settings (optional)
						  exclude = {
								  filetypes = { "help", "terminal", "NvimTree" },
								  buftypes = { "nofile", "prompt", "terminal" },
						  },

						  -- Optional: This ensures the lines only show up where indentation actually is
				  }
		  end
  }
  use {
		  'VonHeikemen/lsp-zero.nvim',
		  requires = {

				  -- Required dependencies (lsp-zero configures these)
				  {'neovim/nvim-lspconfig'},
				  {'williamboman/mason.nvim'},
				  { 'williamboman/mason-lspconfig.nvim' },

				  -- Autocompletion Engine (lsp-zero configures it for you)
				  { 'hrsh7th/nvim-cmp' },
				  { 'hrsh7th/cmp-buffer' },

				  { 'hrsh7th/cmp-path' },
				  { 'hrsh7th/cmp-nvim-lsp' },
				  { 'L3MON4D3/LuaSnip' },
		  }
  }

  end)

