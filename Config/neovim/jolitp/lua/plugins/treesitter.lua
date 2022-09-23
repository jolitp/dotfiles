import('nvim-treesitter.configs', function(plugin)
  plugin.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
    -- programming languages
      -- A
      -- B
      "bash", "bibtex",
      -- C
      "c", "c_sharp", "clojure", "cmake",
      "comment", -- TODO, FIXME, BUG, etc
      "commonlisp", "cpp", "css",
      -- D
      "dart", "dockerfile",
      -- E
      "elm", "elixir", "eex", "elvish",
      "embedded_template", -- EJS
      -- F
      "fish","foam",
      -- G
      "gdscript", "gitattributes", "gitignore",
      "godot_resource", "graphql",
      -- H
      "haskell", "help", "hjson", "html", "http",
      -- I
      -- J
      "javascript", "jsdoc", "json", "json5", "jsonc",
      -- K
      "kotlin",
      -- L
      "latex", "ledger", "lua",
      -- M
      "make", "markdown", "markdown_inline",
      -- N
      "ninja", "nix", "norg",
      -- O
      "org",
      -- P
      "php", "phpdoc", "python", "prisma", "pug", "query",
      -- Q
      -- R
      "racket", "regex", "rust", "rst", "ruby",
      -- S
      "svelte", "scheme", "scss", "slint", "solidity", "sql",
      -- T
      "typescript", "teal", "todotxt", "toml", "tsx",
      -- U
      -- V
      "vue", "v", "vim",
      -- W
      -- X
      -- Y
      "yaml",
      -- Z
      "zig"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "c", "rust" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages

      additional_vim_regex_highlighting = { "org" },
      -- Required for spellcheck,
      -- some LaTex highlights and code block highlights that do not have ts grammar
    },
  }
end)
