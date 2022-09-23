import("orgmode", function(plugin)
  plugin.setup_ts_grammar()
  plugin.setup({
    -- org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
    -- org_default_notes_file = '~/Dropbox/org/refile.org',
  })
end)
