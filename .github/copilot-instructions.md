# Copilot instructions for this Neovim config

## Build, test, and lint commands

This repository does not define an automated test suite (no test runner config or test scripts).

- **Lint/format JS/TS/JSON/CSS with Biome config**
  - Full check: `biome check --config-path ./biome.jsonc .`
  - Format one file: `biome format --config-path ./biome.jsonc --write <path-to-file>`
- **Refresh plugins in headless mode (for config changes):**
  - `nvim --headless "+Lazy! sync" +qa`

## High-level architecture

- **Entry point:** `init.lua` loads base modules and then `lua/config/*` modules (`lazy`, `lsp`, `cmp`, `autopairs`, `telescope`, git helpers, UI), then sets editor options and autocmds.
- **Plugin system:** `lua/config/lazy.lua` bootstraps `folke/lazy.nvim`; `lua/plugins.lua` is the single plugin spec table and wires each plugin to its config module.
- **Formatting path (web stack):**
  - `init.lua` registers `BufWritePre` autocmd for `*.js,*.jsx,*.ts,*.tsx,*.json,*.css` to run `:Neoformat`.
  - `lua/biome.lua` defines Neoformat providers that call `biome format --config-path $HOME/.config/nvim/biome.jsonc`.
  - `lua/config/lsp.lua` also provides `<space>lf` formatting logic (Neoformat first if available, then LSP format fallback).
- **LSP and completion path:** `lua/config/lsp.lua` sets Mason + `lua_ls`/`ts_ls` (fallback `tsserver`), diagnostics, and code-action filters; `lua/config/cmp.lua` + `lua/config/autopairs.lua` provide completion/snippets + pair insertion.
- **Git UX stack:** `lua/config/gitsigns.lua`, `lua/config/diffview.lua`, `lua/config/neogit.lua`, `lua/config/git.lua`, and Telescope git pickers in `lua/config/telescope.lua` are designed to work together under `<space>g*` and `<space>G*`.
- **JS/TS import navigation:** `lua/config/gf.lua` overrides `gf` for JS/TS files to resolve `@/` imports to `src/` plus extension/index candidates.

## Key conventions in this codebase

- **Defensive module loading:** config modules commonly use `pcall(require, ...)` and `return` early if a dependency is unavailable.
- **Config split by feature:** each concern lives in `lua/config/<feature>.lua`; plugin specs call `require("config.<feature>")` from `plugins.lua`.
- **Leader key is space:** mappings are registered as `<space>...` and grouped with `which-key`.
- **User-facing text is mostly Portuguese:** keymap descriptions and notifications follow that language; keep new messages consistent.
- **TypeScript code-action filtering is intentional:** in `lsp.lua`, move-file refactors are filtered out for TS/JS filetypes; keep that behavior unless explicitly changing workflow.
- **MCP docs lookup is prewired:** workspace server `neovim_docs_search` is defined in `.vscode/mcp.json` using `@modelcontextprotocol/server-fetch` with Neovim/GitHub docs hosts allowlisted.
