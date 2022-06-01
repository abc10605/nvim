local status_ok, augend = pcall(require, "dial.augend")
if not status_ok then
  return
end

local status_ok_2, dial = pcall(require, "dial.config")
if not status_ok_2 then
  return
end

local status_ok_3, keymap = pcall(require, "dial.map")
if not status_ok_3 then
  return
end

vim.api.nvim_set_keymap("n", "<C-a>", keymap.inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", keymap.dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", keymap.inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", keymap.dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", keymap.inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", keymap.dec_gvisual(), { noremap = true })

local default = {
  augend.integer.alias.decimal,
  augend.integer.alias.hex,
  augend.date.alias["%Y/%m/%d"],
  augend.date.alias["%Y-%m-%d"],
  augend.date.alias["%m/%d"],
  augend.date.alias["%H:%M"],
  augend.constant.alias.bool,
  augend.constant.new {
    elements = { "&&", "||" },
    word = false,
    cyclic = true,
  }
}

dial.augends:register_group {
  default = default,
  python = {
    augend.constant.new {
      elements = { "True", "False" },
      word = true,
      cyclic = true,
    },
  }
}
