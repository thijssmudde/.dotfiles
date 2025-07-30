-- Define the function to insert console.log() at the current line
function insertConsoleLog()
    vim.api.nvim_put({"console.log();"}, 'l', true, true)
end

-- Map the function to the <leader>log key combination
vim.api.nvim_set_keymap('n', '<leader>log', ':lua insertConsoleLog()<CR>', { noremap = true, silent = true })
