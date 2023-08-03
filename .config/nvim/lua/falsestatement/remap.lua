vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format {
        formatting_options = {
            tabSize = 4,
            insertSpaces = true,
            trimTrailingWhitespace = true,
            insertFinalNewline = true,
            trimFinalNewLines = true
        }
    }
end)
vim.keymap.set("n", "<leader>mdp", vim.cmd.MarkdownPreviewToggle)
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<M-h>", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<M-l>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<leader>bc", ":bd <CR> <BAR> :bp <CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<leader>id", require("lsp_lines").toggle, { desc = "Inline Diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
