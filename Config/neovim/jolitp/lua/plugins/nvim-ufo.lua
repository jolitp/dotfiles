import("ufo", function(plugin)
  -- set vim options to work better with ufo
  vim.o.foldcolumn = '1'
  -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true


  plugin.setup({
    -- setup completion with treesitter
    -- NOTE: does not work with orgmode
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
  })
end)
