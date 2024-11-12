return {
    'neovim/nvim-lspconfig',

    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        --vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#161617]]
        --vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white]]

        local border = {
            {"╭", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╮", "FloatBorder"},
            {"│", "FloatBorder"},
            {"╯", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╰", "FloatBorder"},
            {"│", "FloatBorder"},
        }

        local handlers =  {
            ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
            ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
        }

        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        vim.opt.termguicolors = true

        lspconfig.clangd.setup({
            capabilities = capabilities,
            handlers = handlers
        })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end 
}
