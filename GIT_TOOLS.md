# Git Tools Guide - AstroNvim Style

This document describes the refactored git tools integration for this Neovim configuration.

## Overview

The configuration now includes three complementary git tools with AstroNvim-style setup:

1. **Gitsigns** - Inline git status and hunk management
2. **Diffview** - Side-by-side diff viewing with file history
3. **Neogit** - Full-featured Magit-like git client

## Quick Reference

### Gitsigns - Hunk Management

| Key | Action |
|-----|--------|
| `]g` / `[g` | Next/Previous hunk |
| `<leader>gs` | Stage hunk (normal/visual) |
| `<leader>gS` | Stage entire buffer |
| `<leader>gr` | Reset hunk (normal/visual) |
| `<leader>gR` | Reset entire buffer |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gB` | Blame line (full commit info) |
| `<leader>gd` | Diff current file |
| `<leader>gD` | Diff (cached/staged) |

### Toggles

All toggles available under `<leader>gt`:

| Key | Action |
|-----|--------|
| `<leader>gth` | Toggle hunk signs visibility |
| `<leader>gtw` | Toggle word diff highlighting |
| `<leader>gtl` | Toggle line highlight |
| `<leader>gtn` | Toggle number highlight |
| `<leader>gtt` | Toggle current line blame |

### Text Objects

| Key | Context | Action |
|-----|---------|--------|
| `ig` | Visual/Operator mode | Select inside hunk |

## Diffview - Visual Diffs

Provides split-view for browsing git diffs with file tree and history.

| Key | Action |
|-----|--------|
| `<leader>gv` | Open diffview (current changes) |
| `<leader>gf` | File history (current file) |
| `<leader>gh` | Repo history (all branches) |
| `<leader>gc` | Close diffview |

### Features

- Tree view of changed files
- Side-by-side diffs with syntax highlighting
- File history tracking
- Enhanced diff highlighting
- Integrated with gitsigns
- Help available with `g?`

## Telescope Git Browser

Browse git information with Telescope picker.

| Key | Action |
|-----|--------|
| `<leader>Gb` | Git branches |
| `<leader>Gc` | Git commits |
| `<leader>Gf` | Git files |
| `<leader>Gs` | Git status |

### Features

- Interactive branch switching
- Commit history browsing
- File picker filtered by git
- Status overview with picker

## Neogit - Full Git Client

Magit-like interface for complex git operations.

| Key | Action |
|-----|--------|
| `<leader>gg` | Open Neogit (main status view) |
| `<leader>gm` | Open Neogit (commit view) |
| `<leader>gP` | Open Neogit (pull dialog) |
| `<leader>gU` | Open Neogit (push dialog) |

### Features

- Full staging/unstaging interface
- Commit composition with editor
- Branch management
- Merge/rebase handling
- Integrated with Diffview and Telescope
- Magit-like keybindings within the UI
- Customizable layout with splits and tabs

### Neogit Workflow

1. Open status: `<leader>gg`
2. Stage changes with `s` or `u` to unstage
3. Commit with `c c` (compose commit)
4. Push with `P` or pull with `l`

## Configuration Files

- `lua/config/git.lua` - Git utilities and which-key setup
- `lua/config/gitsigns.lua` - Gitsigns configuration with keymaps
- `lua/config/diffview.lua` - Diffview configuration
- `lua/config/neogit.lua` - Neogit configuration (AstroNvim style)

## Recommended Workflow

### Quick hunk staging
1. Use `]g`/`[g` to navigate hunks
2. Use `<leader>gs` to stage individual hunks
3. Use `<leader>gp` to preview before staging
4. Use `<leader>gg` to commit

### Reviewing branch changes
1. Use `<leader>gv` to open diffview
2. Navigate files in left panel
3. Review diffs in main panel
4. Close with `<leader>gc` or `q`

### Complex operations
1. Use `<leader>gg` to open Neogit for complex operations
2. Rebase, merge, reset, or cherry-pick within Neogit
3. Integrated with Diffview for reviewing changes

## Key Improvements from Previous Version

✓ Cleaner configuration structure
✓ AstroNvim-style setup and layout
✓ Better icon support (aligned with modern Neovim setups)
✓ Improved which-key integration with full descriptions
✓ Fixed lazy-loading issues with gitsigns
✓ Enhanced diffview with better UI elements
✓ Refactored Neogit with proper section folding
✓ Consistent keymaps organization
✓ Better visual feedback with modern signs

## Tips

### Using Hunks Efficiently
- Stage only the changes you want to commit
- Use visual selection (`v`) for partial hunk staging
- Preview (`<leader>gp`) before staging to avoid mistakes

### Viewing Diffs
- `<leader>gd` shows working tree changes
- `<leader>gD` shows staged changes (--cached)
- `<leader>gv` is best for reviewing multiple files

### Blaming Code
- `<leader>gb` shows blame for current line
- `<leader>gB` shows full commit information
- Useful with blame lines in blame-mode for understanding history

