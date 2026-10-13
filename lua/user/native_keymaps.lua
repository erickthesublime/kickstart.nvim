-- Native Neovim shortcuts migrated from Bindsync's keybinds.toml.
-- This file is the editable source of truth once the migration is activated.
-- Keep each binding near its explanation; the command text below is preserved
-- verbatim to avoid changing plugin initialization and command-line behavior.
-- Source snapshot: erickthesublime/bindsync keybinds.toml, blob b37c61c5fe7cf0ddd7bcc89c08d534bb228bc396.
-- Requires the user's existing modules/plugins; their presence in this repo is not verified.

local map = vim.keymap.set

-- cfr: insert reference: Pre-fill :Cfr so I can type 61.53 or 61.53(a)(1) and insert a CFR link macro
map("n", "<leader>cr", "<cmd>lua pcall(function() require('user.cfr').setup() end)<CR>:Cfr ", {
  noremap = true,
  silent = true,
  desc = "Pre-fill :Cfr so I can type 61.53 or 61.53(a)(1) and insert a CFR link macro",
})

-- objmgr: save now: Scan %== OBJ … %== ENDOBJ blocks and upsert to SQLite
map("n", "<leader>os", "<cmd>lua pcall(function() require('objmgr').setup() end); vim.cmd('ObjSave')<CR>", {
  noremap = true,
  silent = true,
  desc = "Scan %== OBJ … %== ENDOBJ blocks and upsert to SQLite",
})

-- objmgr: new object (default): Insert a default templated block (theorem, draft)
map("n", "<leader>on", "<cmd>lua pcall(function() require('objmgr').setup() end); require('objmgr').new_object()<CR>", {
  noremap = true,
  silent = true,
  desc = "Insert a default templated block (theorem, draft)",
})

-- objmgr: browse: Telescope picker → paste selected object block
map("n", "<leader>ob", "<cmd>lua pcall(function() require('objmgr').setup() end); vim.cmd('ObjBrowse')<CR>", {
  noremap = true,
  silent = true,
  desc = "Telescope picker → paste selected object block",
})

-- objmgr: set db (optional): Prompt for a custom SQLite path (this session)
map("n", "<leader>od", "<cmd>lua local p = vim.fn.input('objmgr db path: ', vim.g.objmgr_db_path or vim.fn.expand('~/.local/share/tex-objects/objects.sqlite')); if p ~= '' then vim.g.objmgr_db_path = p end<CR>", {
  noremap = true,
  silent = true,
  desc = "Prompt for a custom SQLite path (this session)",
})

-- vocab: inline toggle: Toggle parsing & persisting vocabnote blocks on :w
map("n", "<leader>vt", "<cmd>lua pcall(function() require('user.vocab').setup() end); vim.cmd('VocabInlineToggle')<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle parsing & persisting vocabnote blocks on :w",
})

-- vocab: inline save now: Immediately persist all vocabnote blocks in this buffer
map("n", "<leader>vs", "<cmd>lua pcall(function() require('user.vocab').setup() end); vim.cmd('VocabInlineSaveNow')<CR>", {
  noremap = true,
  silent = true,
  desc = "Immediately persist all vocabnote blocks in this buffer",
})

-- vocab: pick: Open vocab Telescope picker
map("n", "<leader>vv", "<cmd>lua pcall(function() require('user.vocab').setup() end); require('user.vocab').pick()<CR>", {
  noremap = true,
  silent = true,
  desc = "Open vocab Telescope picker",
})

-- vocab: paste all: Insert exported TeX for all items (grouped by Category)
map("n", "<leader>va", "<cmd>lua pcall(function() require('user.vocab').setup() end); vim.cmd('VocabPasteAll')<CR>", {
  noremap = true,
  silent = true,
  desc = "Insert exported TeX for all items (grouped by Category)",
})

-- vocab: paste category: Choose a Category then insert its export
map("n", "<leader>vc", "<cmd>lua pcall(function() require('user.vocab').setup() end); vim.cmd('VocabPasteCategory')<CR>", {
  noremap = true,
  silent = true,
  desc = "Choose a Category then insert its export",
})

-- cpp-run: Calls user.cpp_compile_run.compile_and_run()
map("n", "<F5>", "<cmd>lua require('user.cpp_compile_run').compile_and_run()<CR>", {
  noremap = true,
  silent = true,
  desc = "Calls user.cpp_compile_run.compile_and_run()",
})

-- tex-insert-input: Runs InsertInputAndOpen()
map("n", "<leader>ni", ":lua InsertInputAndOpen()<CR>", {
  noremap = true,
  silent = true,
  desc = "Runs InsertInputAndOpen()",
})

-- TeX: pick inputs: Open included TeX files in a new tab
map("n", "<leader>li", "<cmd>lua require('user.tex_inputs').pick_input()<CR>", {
  noremap = true,
  silent = true,
  desc = "Open included TeX files in a new tab",
})

-- vimtex-compile: Run :VimtexCompile
map("n", "Z", ":VimtexCompile<CR>", {
  noremap = true,
  silent = true,
  desc = "Run :VimtexCompile",
})

-- clipboard-yank-n: Yank to "+ register (Normal mode)
map("n", "<leader>y", "\"+y", {
  noremap = true,
  silent = true,
  desc = "Yank to \"+ register (Normal mode)",
})

-- clipboard-yank-v: Yank to "+ register (Visual mode)
map("v", "<leader>y", "\"+y", {
  noremap = true,
  silent = true,
  desc = "Yank to \"+ register (Visual mode)",
})

-- clipboard-paste-n: Paste from "+ register (Normal mode)
map("n", "<leader>p", "\"+p", {
  noremap = true,
  silent = true,
  desc = "Paste from \"+ register (Normal mode)",
})

-- clipboard-paste-v: Paste from "+ register (Visual mode)
map("v", "<leader>p", "\"+p", {
  noremap = true,
  silent = true,
  desc = "Paste from \"+ register (Visual mode)",
})

-- netrw-ex-tab: Open :Ex at the current file's directory in a new tab
map("n", "<leader>et", "<cmd>tabnew<CR><cmd>Ex %:p:h<CR>", {
  noremap = true,
  silent = true,
  desc = "Open :Ex at the current file's directory in a new tab",
})

-- win-next: Cycles through windows
map("n", "<C-Right>", "<C-W>w", {
  noremap = true,
  silent = true,
  desc = "Cycles through windows",
})

-- tab-prev: Go to previous tab
map("n", "<S-CR>", ":tabprevious<CR>", {
  noremap = true,
  silent = true,
  desc = "Go to previous tab",
})

-- tab-next: Go to next tab
map("n", "<C-CR>", ":tabnext<CR>", {
  noremap = true,
  silent = true,
  desc = "Go to next tab",
})

-- texshot-shot: Runs user.texshot.snap_plain()
map("n", "<leader>sf", "<cmd>lua require('user.texshot').snap_plain()<CR>", {
  noremap = true,
  silent = true,
  desc = "Runs user.texshot.snap_plain()",
})

-- texshot-annotate: To-do: rework (e.g., open in Inkscape)
-- Reference only; no action was defined for <leader>sF.

-- bible-picker: Open the Bible picker (Telescope)
map("n", "B", "<cmd>lua require('bible.picker')()<CR>", {
  noremap = true,
  silent = true,
  desc = "Open the Bible picker (Telescope)",
})

