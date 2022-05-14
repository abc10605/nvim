local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local icons = require "user.icons"

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                                                                          ]],
  [[                                                                          ]],
  [[                               :                                          ]],
  [[L.                     ,;     t#,                                         ]],
  [[EW:        ,ft       f#i     ;##W.                t                       ]],
  [[E##;       t#E     .E#t     :#L:WE                Ej            ..       :]],
  [[E###t      t#E    i#W,     .KG  ,#D   t      .DD. E#,          ,W,     .Et]],
  [[E#fE#f     t#E   L#D.      EE    ;#f  EK:   ,WK.  E#t         t##,    ,W#t]],
  [[E#t D#G    t#E :K#Wfff;   f#.     t#i E#t  i#D    E#t        L###,   j###t]],
  [[E#t  f#E.  t#E i##WLLLLt  :#G     GK  E#t j#f     E#t      .E#j##,  G#fE#t]],
  [[E#t   t#K: t#E  .E#L       ;#L   LW.  E#tL#i      E#t     ;WW; ##,:K#i E#t]],
  [[E#t    ;#W,t#E    f#E:      t#f f#:   E#WW,       E#t    j#E.  ##f#W,  E#t]],
  [[E#t     :K#D#E     ,WW;      f#D#;    E#K:        E#t  .D#L    ###K:   E#t]],
  [[E#t      .E##E      .D#;      G#t     ED.         E#t :K#t     ##D.    E#t]],
  [[..         G#E        tt       t      t           E#t ...      #G      .. ]],
  [[            fE                                    ,;.          j          ]],
  [[             ,                                                            ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. icons.documents.Files .. "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. icons.ui.NewFile .. "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button(
    "p",
    " " .. icons.git.Repo .. "  Find project",
    ":lua require('telescope').extensions.projects.projects()<CR>"
  ),
  dashboard.button("r", " " .. icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. icons.ui.List .. "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("s", " " .. icons.ui.SignIn .. "  Find Session", ":SessionManager load_session<CR>"),
  dashboard.button("c", " " .. icons.ui.Gear .. "  Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("u", " " .. icons.ui.Check .. "  Update Plugins", ":PackerSync<CR>"),
  dashboard.button("q", " " .. icons.diagnostics.Error .. "  Quit", ":qa<CR>"),
}

function Dashboard_footer()
  ---@diagnostic disable-next-line: undefined-global
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %Y-%m-%d   %H:%M"
  local platform = vim.fn.has "win32" == 1 and " Windows" or " Unix"
  local str = string.format(
    " %d Plugins    v%d.%d.%d   %s   %s",
    plugins,
    v.major, v.minor, v.patch,
    platform,
    datetime
  )
  dashboard.section.footer.val = { string.format("", #str), str }
end

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
