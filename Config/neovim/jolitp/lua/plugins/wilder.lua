import("wilder", function(wilder)

-- pipeline ------------------------------------------------- pipeline NOTE not wrking
--   wilder.set_option('pipeline', {
--     wilder.branch(
--       wilder.python_file_finder_pipeline({
--         file_command = function(ctx, arg)
--           if string.find(arg, '.') ~= nil then
--             return {'fdfind', '-tf', '-H'}
--           else
--             return {'fdfind', '-tf'}
--           end
--         end,
--         dir_command = {'fd', '-td'},
--
--         -- I don't want to install this from source
--         filters = {'cpsm_filter'},
--         -- filters = {'fuzzy_filter', 'difflib_sorter'},
--       }), -- wilder.python_file_finder_pipeline({
--       wilder.substitute_pipeline({
--         pipeline = wilder.python_search_pipeline({
--           skip_cmdtype_check = 1,
--           pattern = wilder.python_fuzzy_pattern({
--             start_at_boundary = 0,
--           }),
--         }),
--       }), -- wilder.substitute_pipeline({
--       wilder.cmdline_pipeline({
--         fuzzy = 2,
--         fuzzy_filter = wilder.lua_fzy_filter(),
--       }), -- wilder.cmdline_pipeline({
--       {
--         wilder.check(function(ctx, x) return x == '' end),
--         wilder.history(),
--       },
--       wilder.python_search_pipeline({
--         pattern = wilder.python_fuzzy_pattern({
--           start_at_boundary = 0,
--         }),
--       }) -- wilder.python_search_pipeline({
--     ), --wilder.branch(
--   }) -- wilder.set_option('pipeline', {
-- pipeline ------------------------------------------------- pipeline NOTE not wrking

-- pipeline ------------------------------------------------- pipeline
  wilder.set_option('pipeline', {
    wilder.branch(

      wilder.cmdline_pipeline({
        -- sets the language to use, 'vim' and 'python' are supported
        language = 'python',
        -- 0 turns off fuzzy matching
        -- 1 turns on fuzzy matching
        -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
        fuzzy = 2,
      }),

      wilder.python_search_pipeline({
        -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
        pattern = wilder.python_fuzzy_pattern(),
        -- omit to get results in the order they appear in the buffer
        sorter = wilder.python_difflib_sorter(),
        -- can be set to 're2' for performance, requires pyre2 to be installed
        -- see :h wilder#python_search() for more details
        engine = 're',
      }),

      wilder.substitute_pipeline({
        pipeline = wilder.python_search_pipeline({
          skip_cmdtype_check = 1,
          pattern = wilder.python_fuzzy_pattern({
            start_at_boundary = 0,
          }),
        }),
      }), -- wilder.substitute_pipeline({

      { -- I don't know exactly what it is
        wilder.check(function(ctx, x) return x == '' end),
        wilder.history(),
      },

      wilder.python_file_finder_pipeline({
        -- to use ripgrep : {'rg', '--files'}
        -- to use fd      : {'fd', '-tf'}
        file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'},
        -- to use fd      : {'fd', '-td'}
        dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
        -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
        -- found at https://github.com/nixprime/cpsm
        filters = {'fuzzy_filter', 'difflib_sorter'},
      }) -- wilder.python_file_finder_pipeline({

    ) -- wilder.branch(
  }) -- wilder.set_option('pipeline', {
-- pipeline ------------------------------------------------- pipeline


-- highlighters ------------------------------------------------- highlighters
  local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.lua_fzy_highlighter(),
  } -- local highlighters = {
-- highlighters ------------------------------------------------- highlighters


-- popup menu ------------------------------------------------- popup menu
  local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
      border = 'rounded',
      empty_message = wilder.popupmenu_empty_message_with_spinner(),
      highlighter = highlighters,
      left = {
        ' ',
        wilder.popupmenu_devicons(),
        wilder.popupmenu_buffer_flags({
          flags = ' a + ',
          icons = {['+'] = '', a = '', h = ''},
        }),
      },
      right = {
        ' ',
        wilder.popupmenu_scrollbar(),
      },
    }) -- wilder.popupmenu_border_theme({
  ) -- local popupmenu_renderer = wilder.popupmenu_renderer(
-- popup menu ------------------------------------------------- popup menu


-- wild menu (horizontal) --------------------------wild menu (horizontal)
  local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = highlighters,
    separator = ' · ',
    left  = {' ', wilder.wildmenu_spinner(), ' '},
    right = {' ', wilder.wildmenu_index()},
  }) -- local wildmenu_renderer = wilder.wildmenu_renderer({
-- wild menu (horizontal) --------------------------wild menu (horizontal)


-- pallete ------------------------------------------------- pallete
  local wildpallete_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
      highlighter = highlighters,
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters,
      -- see :h wilder#popupmenu_palette_theme() for more details
      border = 'rounded',
      -- max height of the palette
      max_height = '75%',
      -- set to the same as 'max_height' for a fixed height window
      min_height = 0,
      -- 'top' or 'bottom' to set the location of the prompt
      prompt_position = 'bottom',
      -- set to 1 to reverse the order of the list,
      -- use in combination with 'prompt_position'
      reverse = 0,

      left = {
        ' ',
        wilder.popupmenu_devicons(),
        wilder.popupmenu_buffer_flags({
          flags = ' a + ',
          icons = {['+'] = '', a = '', h = ''},
        }),
      },

      right = {
        ' ',
        wilder.popupmenu_scrollbar(),
      },
    }) -- wilder.popupmenu_palette_theme({
  ) -- local wildpallete_renderer = wilder.popupmenu_renderer(
-- pallete ------------------------------------------------- pallete


-- renderer ------------------------------------------------- renderer
  wilder.set_option('renderer', wilder.renderer_mux({
  --  [':'] = popupmenu_renderer,
    [':'] = wildpallete_renderer,
    ['/'] = wildmenu_renderer,
    substitute = wildmenu_renderer,
  })) -- wilder.set_option('renderer', wilder.renderer_mux({
-- renderer ------------------------------------------------- renderer


-- setup ------------------------------------------------- setup
  wilder.setup({
    modes = {':', '/', '?'},

    -- default keys
--     next_key     = '<Tab>',   -- default = '<Tab>'
--     previous_key = '<S-Tab>', -- default = '<S-Tab>'
--     accept_key   = '<Down>',  -- default = '<Down>'
--     reject_key   = '<Up>',    -- default = '<Up>'
  })
-- setup ------------------------------------------------- setup
end)
