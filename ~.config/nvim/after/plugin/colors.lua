function ColorMyTerm(color)
	color = 'gruvbox' or 'green-shades'
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

end
ColorMyTerm()
