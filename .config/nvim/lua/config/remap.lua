vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- allow yanking to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- buffer control
-- move to previous/next
vim.keymap.set("n", ",", ":BufferPrevious<CR>")
vim.keymap.set("n", ".", ":BufferNext<CR>")
-- re-order to previous/next
vim.keymap.set("n", "<", ":BufferMovePrevious<CR>")
vim.keymap.set("n", ">", ":BufferMoveNext<CR>")
-- goto buffer in position
for i = 0, 10 do
    vim.keymap.set("n", string.format("<leader>%d", i), string.format(":BufferGoto %d<CR>", i))
end

-- pin/unpin buffer
vim.keymap.set("n", "<leader>tp", ":BufferPin<CR>")
-- close buffer
vim.keymap.set("n", "<leader>c", ":BufferClose<CR>")
-- sort buffers automatically
vim.keymap.set("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>")
vim.keymap.set("n", "<leader>bd", ":BufferOrderByDirectory<CR>")
vim.keymap.set("n", "<leader>bl", ":BufferOrderByLanguage<CR>")
vim.keymap.set("n", "<leader>bw", ":BufferOrderByWindowNumber<CR>")

