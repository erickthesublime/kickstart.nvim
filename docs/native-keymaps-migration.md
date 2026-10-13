# Native Neovim keymaps — migration staging

This branch adds `lua/user/native_keymaps.lua`, a **human-editable** replacement for the mappings defined in Bindsync's `keybinds.toml` at blob `b37c61c5fe7cf0ddd7bcc89c08d534bb228bc396`.

## What is migrated

- 24 executable mappings copied with their original modes, left-hand keys, right-hand actions, and descriptions.
- One reference-only mapping (`<leader>sF`) remains a comment, because it never had a runnable action.
- Module setup calls have deliberately **not** been simplified: ObjMgr, CFR and vocab actions can depend on their previous initialization order.

## Why this is not automatically loaded

The GitHub checkout inspected here contains a Kickstart `init.lua` but no verified `require('user.keybinds.generated')` statement, and the custom plugin/module files are not established in this repository. **Adding an unconditional require here could break a different Neovim environment.** This PR does not modify `init.lua` or activate the replacement.

## Local inspection, testing and cutover

1. Check `git status --short` in `~/.config/nvim` and `~/.config/keybinds`; preserve local differences. Verify these GitHub files match the actual Neovim installation before changing anything.
2. Inspect the actual `init.lua`, plugin loading, and `lua/user/keybinds/generated.lua`; search for all `require('user.keybinds.generated')` usages. Verify `user.cfr`, `objmgr`, `user.vocab`, `user.cpp_compile_run`, `user.tex_inputs`, `user.texshot`, and `bible.picker` exist.
3. In a separate `NVIM_APPNAME` test configuration with the same required modules, load `require('user.native_keymaps')` **instead of**, not alongside, `require('user.keybinds.generated')`. Ensure `vim.g.mapleader` has been initialized first.
4. Run `:verbose nmap <leader>os`, `:verbose nmap <F5>`, `:verbose vmap <leader>y` and compare behavior of the user-facing actions (including commands that write to SQLite).
5. Check duplicate mappings against manual/plugin definitions. Check terminal handling of `<C-CR>`, `<S-CR>` and `<C-Right>`.
6. Only after testing, replace the old generated-module load statement on the **actual** installation and stop Bindsync regenerating Neovim files. Do not delete the old file until the native module is confirmed active.

## Rollback

Before acceptance, abandon this branch: `master` and the local installation remain unchanged. After deployment, restore the previous Neovim require/loading path and previously saved configuration, then verify `:verbose map` against the original assignments. Git rollback does not undo any data changes caused by invoking shortcut actions.

## Outstanding

- Confirm actual Neovim config ownership and startup chain.
- Verify module availability and command registration.
- Runtime behavior has **not** been tested.
- SRD identity for Bindsync: `srd:c8c2917e-aabc-4827-88d8-58cd1091aa7d`.
