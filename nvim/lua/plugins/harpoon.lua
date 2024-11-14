return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set('n','<leader>a', function() harpoon:list():add() end)
        vim.keymap.set('n','<C-e>', function()harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.api.nvim_create_autocmd({ "Filetype" }, {
            pattern = "harpoon",
              callback = function()
                vim.opt.cursorline = true
                vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
                vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
              end
        })
    end
}
