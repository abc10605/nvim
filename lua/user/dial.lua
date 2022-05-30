local status_ok, dial = pcall(require, "dial")
if not status_ok then
	return
end

vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), {noremap = true})

dial.augends["custom#boolean"] = dial.common.enum_cyclic({
	name = "boolean",
	strlist = { "true", "false" },
})
table.insert(dial.config.searchlist.normal, "custom#boolean")

-- For Languages which prefer True/False, e.g. python.
dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
	name = "Boolean",
	strlist = { "True", "False" },
})
table.insert(dial.config.searchlist.normal, "custom#Boolean")
