require("falsestatement.remap")

vim.wo.relativenumber = true

vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'AutoFormatting',
    callback = function()
        vim.lsp.buf.format({
            formatting_options = {
                tabSize = 4,
                insertSpaces = true,
                trimTrailingWhitespace = true,
                insertFinalNewline = true,
                trimFinalNewLines = true
            }
        })
    end,
})

vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(invalid_win, w)
            end
        end
        if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
    end
})

vim.cmd.set("shiftwidth=4 smarttab")
vim.cmd.set("expandtab")
vim.cmd.set("tabstop=8 softtabstop=0")

vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/rCursor'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.g.conoline_auto_enable = 1
vim.g.conoline_use_colorscheme_default_normal = 1
vim.g.conoline_use_colorscheme_default_insert = 1
