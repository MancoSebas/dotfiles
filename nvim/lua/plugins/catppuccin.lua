return {
{ 
    'mellow-theme/mellow.nvim', 

    config = function()
        vim.g.mellow_transparent = true
        vim.cmd([[colorscheme mellow]])
    end 
	}
}

