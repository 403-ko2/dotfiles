local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
--Return back to file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Split window vertically
vim.keymap.set("n", "wv", "<C-w>v")

--Split window horiszontally
vim.keymap.set("n", "ws", "<C-w>s")

--Return to previous buffer
vim.keymap.set("n", "L", ":bnext<CR>")

--Close all but current window
vim.keymap.set("n", "wo", "<C-w>o")

--Close specific windows from current
vim.keymap.set("n", "<leader>wh", "<C-w>h:close<CR>", { silent = true, desc = "Close window to left" })
vim.keymap.set("n", "<leader>wl", "<C-w>l:close<CR>", { silent = true, desc = "Close window to right" })
vim.keymap.set("n", "<leader>wk", "<C-w>k:close<CR>", { silent = true, desc = "Close window above" })
vim.keymap.set("n", "<leader>wj", "<C-w>j:close<CR>", { silent = true, desc = "Close window below" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { silent = true, desc = "Close current window" })

--Window navigation
vim.keymap.set("n", "wl", "<C-w>l", { desc = "navigate to window on right" })
vim.keymap.set("n", "wh", "<C-w>h", { desc = "navigate to window on left" })
vim.keymap.set("n", "wj", "<C-w>j", { desc = "navigate to window on down" })
vim.keymap.set("n", "wk", "<C-w>k", { desc = "navigate to window on up" })

--Resize Vertical Windows
vim.keymap.set("n", "<leader>-", ":vertical resize -10<CR>", { desc = "Decrease" })
vim.keymap.set("n", "<leader>+", ":vertical resize +10<CR>", { desc = "Increase" })

--Normal Mode Move lines Up + Down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "UP" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "DOWN" })

--Visual Mode Move Lines Up + Down
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "UP" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "DOWN" })

--changing indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search hl", silent = true })

-- Replace the word cursor is on globally
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- tab stuff
--vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
--vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
--vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     --go to next
--vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     --go to pre
--vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

-- format without prettier using the built in
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })
