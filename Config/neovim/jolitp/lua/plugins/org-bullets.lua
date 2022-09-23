import("org-bullets", function(plugin)
  plugin.setup({
    -- If false then when the cursor is
    -- on a line underlying characters are visible
    concealcursor = false,

    symbols = {
      -- headlines can be a list
      -- headlines = { "◉", "○", "✸", "✿" },
      headlines = {
       "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩",
       "⑪", "⑫", "⑬", "⑭", "⑮", "⑯", "⑰", "⑱", "⑲", "⑳",
       "㉑", "㉒", "㉓", "㉔", "㉕", "㉖", "㉗", "㉘", "㉙", "㉚",
       "㉛", "㉜", "㉝", "㉞", "㉟", "㊱", "㊲", "㊳", "㊴", "㊵",
       "㊶", "㊷", "㊸", "㊹", "㊺", "㊻", "㊼", "㊽", "㊾", "㊿",
      },
      -- or a function that receives the defaults and returns a list
--       headlines = function(default_list)
--           table.insert(default_list, "♥")
--           return default_list
--       end,
      checkboxes = {
          half = { "", "OrgTSCheckboxHalfChecked" },
          done = { "✓", "OrgDone" },
          todo = { "˟", "OrgTODO" },
      },
    }
  })
end)
