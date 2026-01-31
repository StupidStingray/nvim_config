return {

{
    "lukas-reineke/indent-blankline.nvim",
		  config = function()
				  require('ibl').setup({
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
				  })
		  end,
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
},
}

