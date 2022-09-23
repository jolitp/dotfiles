local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

import("which-key", function(wk)
-- for examples: https://github.com/folke/which-key.nvim

-- mappings under <leader> / Space
  local mappings = {
    f = {
      name = "Files",
      f = { ":Telescope find_files<cr>",   "Find Files" },
      s = { ":w<cr>",                      "Save File" },
      e = { ":NeoTreeShowToggle<cr>",      "File Explorer" },
    },
    p = {
      name = "Packages",
      c = { ":PackerCompile<cr>",  "Packer Complile" },
      C = { ":PackerClean<cr>",    "Packer Clean" },
      s = { ":PackerSync<cr>",     "Packer Sync" },
      S = { ":PackerStatus<cr>",   "Packer Status" },
      u = { ":PackerUpdate<cr>",   "Packer Update" },
      i = { ":ImportStatus<cr>",   "Import Status" },
    },
    q = {
      name = "Quit",
      q = { ":q<cr>",    "Quit" },
      q = { ":q!<cr>",   "Quit (force)" }
    }
  }
  local opts = { prefix = "<leader>" }
  wk.register(mappings, opts)
-- mappings under <leader> / Space

end) -- import("which-key", function(plugin)

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- ubiquous keybindings
keymap("i", "<C-s>", ":w<cr>", opts)
keymap("n", "<C-s>", ":w<cr>", opts)

keymap("v", "<C-x>", "d<cr>",  opts)
keymap("x", "<C-x>", "d<cr>",  opts)

keymap("v", "<C-c>", "y<cr>",  opts)
keymap("x", "<C-c>", "y<cr>",  opts)

keymap("v", "<C-v>", "p<cr>",  opts)
keymap("x", "<C-v>", "p<cr>",  opts)

-- GUI font size plugin
vim.keymap.set("n", "<A-Up>",    "<cmd>:GUIFontSizeUp<CR>",   opts)
vim.keymap.set("n", "<A-Down>",  "<cmd>:GUIFontSizeDown<CR>", opts)
vim.keymap.set("n", "<A-0>",     "<cmd>:GUIFontSizeSet<CR>",  opts)

-- LSP Saga

-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
vim.keymap.set(
  { "n", "v" },
  "<leader>ca",
  "<cmd>Lspsaga code_action<CR>",
  { silent = true }
)

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
vim.keymap.set(
  "n",
  "[E",
  function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end,
  { silent = true }
)

vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })

-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })

-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- barbar

local map = vim.api.nvim_set_keymap

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- ufo - folding
-- Using ufo provider need remap `zR` and `zM`.
-- If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

