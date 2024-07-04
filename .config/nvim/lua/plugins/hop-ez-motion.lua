return {
	"smoka7/hop.nvim",
	tag = "*", -- optional but strongly recommended
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

		-- place this in one of your configuration file(s)
		local hop = require("hop")
		-- local directions = require("hop.hint").HintDirection

		vim.keymap.set("", "f", function()
			hop.hint_char1()
		end, { remap = true })
		vim.keymap.set("", "F", function()
			hop.hint_words()
		end, { remap = true })

		vim.keymap.set("", "<Leader>p", function()
			hop.hint_patterns()
		end, { remap = true })
	end,
}
