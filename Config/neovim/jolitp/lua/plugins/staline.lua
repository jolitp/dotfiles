import("staline", function(plugin)
  plugin.setup{
    sections = {
      left = { ' ', 'mode', ' ', 'branch', ' ', 'lsp' },
      mid = { "file_name", },
      right = { { 'StalineGit', 'branch' }, "lsp_name", 'line_column' }
    },
    mode_colors = {
      i = "#d4be98",
      n = "#84a598",
      c = "#8fbf7f",
      v = "#fc802d",
    },
    defaults = {
      true_colors = true,
      line_column = " [%l/%L] :%c  並%p%% ",
      branch_symbol = " "
    }
  }
end)
