-- help options
-- to get more information on the options type:

-- :help options

vim.opt.backup = false            -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.completeopt = {           -- mostly just for cmp
  "menuone",
  "noselect"
}
vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"    -- the encoding written to a file
vim.opt.hlsearch = true           -- highlight all matches on previous search pattern
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
vim.opt.pumheight = 10            -- pop up menu height
vim.opt.showmode = true           -- see things like -- INSERT -- anymore
vim.opt.showtabline = 2           -- always show tabs
vim.opt.smartcase = true          -- smart case
vim.opt.smartindent = true        -- make indenting smarter again
vim.opt.splitbelow = true         -- force all horizontal splits to go below current window

-- force all vertical splits to go to the right of current window
vim.opt.splitright = true

vim.opt.swapfile = false          -- creates a swapfile
vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000         -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true           -- enable persistent undo
vim.opt.updatetime = 300          -- faster completion (4000ms default)

-- if a file is being edited by another program
-- (or was written to file while editing with another program),
-- it is not allowed to be edited
vim.opt.writebackup = false

vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.cursorline = true         -- highlight the current line
vim.opt.number = true             -- set numbered lines
vim.opt.relativenumber = true     -- set relative numbered lines
vim.opt.numberwidth = 2           -- set number column width to 2 {default 4}

-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

vim.opt.wrap = true               -- display lines as one long line
vim.opt.scrolloff = 10            -- scroll before cursor reach top or bottom
vim.opt.sidescrolloff = 6         -- scroll before cursor reach left or right
vim.opt.guifont = "Fira Code:h12" -- the font used in graphical neovim applications

vim.opt.shortmess:append "c" -- ???

-- move to next/previous line when using these caracters
vim.cmd "set whichwrap+=<,>,[,]"

-- old way of setting options by calling vimscript
vim.cmd [[set iskeyword+=-]]     -- adds - as part of a word
