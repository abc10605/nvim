local colorscheme = "github-theme"

local status_ok, theme = pcall(require, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

theme.setup({
    theme_style = "dark",
    function_style = "italic", --check :help highlight-args
    comment_style = "italic",
    keyword_style = "italic",
    msg_area_style = "NONE",
    variable_style = "NONE",
    -- Set darker bg
    sidebars = {"qf", "vista_kind", "terminal", "packer"},

    -- Float windows get darker
    dark_float = false,
    -- Sidebar gets darker
    dark_sidebar = false,

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    colors = {hint = "orange", error = "#ff0000"},

    -- Overwrite the highlight groups
    overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
    end
})
