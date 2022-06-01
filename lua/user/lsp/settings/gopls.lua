vim.cmd([[
    augroup gofmt
        autocmd!
        autocmd BufWritePost *.go silent! !go fmt %
        autocmd BufWritePost *.go edit
        autocmd BufWritePost *.go redraw!
    augroup END
]])

return {
  cmd = { "gopls" }
}
