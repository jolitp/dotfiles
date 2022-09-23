import('lsp-zero', function(plugin)
  -- other options:
  -- - recommended
  -- - lsp-compe
  -- - lsp-only
  -- - manual-setup
  -- - per-project
  -- - system-lsp
  plugin.preset('recommended')
  plugin.nvim_workspace()
  plugin.setup()
end)
