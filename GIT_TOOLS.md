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
| `<space>gs` | Stage hunk (normal/visual) |
| `<space>gS` | Stage entire buffer |
| `<space>gr` | Reset hunk (normal/visual) |
| `<space>gR` | Reset entire buffer |
| `<space>gp` | Preview hunk |
| `<space>gb` | Blame line |
| `<space>gB` | Blame line (full commit info) |
| `<space>gd` | Diff current file |
| `<space>gD` | Diff (cached/staged) |

### Toggles

All toggles available under `<space>gt`:

| Key | Action |
|-----|--------|
| `<space>gth` | Toggle hunk signs visibility |
| `<space>gtw` | Toggle word diff highlighting |
| `<space>gtl` | Toggle line highlight |
| `<space>gtn` | Toggle number highlight |
| `<space>gtt` | Toggle current line blame |

### Text Objects

| Key | Context | Action |
|-----|---------|--------|
| `ig` | Visual/Operator mode | Select inside hunk |

## Diffview - Visual Diffs

Provides split-view for browsing git diffs with file tree and history.

| Key | Action |
|-----|--------|
| `<space>gv` | Open diffview (current changes) |
| `<space>gf` | File history (current file) |
| `<space>gh` | Repo history (all branches) |
| `<space>gc` | Close diffview |

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
| `<space>Gb` | Git branches |
| `<space>Gc` | Git commits |
| `<space>Gf` | Git files |
| `<space>Gs` | Git status |

### Features

- Interactive branch switching
- Commit history browsing
- File picker filtered by git
- Status overview with picker

## Neogit - Full Git Client

Magit-like interface for complex git operations.

| Key | Action |
|-----|--------|
| `<space>gg` | Open Neogit (main status view) |
| `<space>gm` | Open Neogit (commit view) |
| `<space>gP` | Open Neogit (pull dialog) |
| `<space>gU` | Open Neogit (push dialog) |

### Features

- Full staging/unstaging interface
- Commit composition with editor
- Branch management
- Merge/rebase handling
- Integrated with Diffview and Telescope
- Magit-like keybindings within the UI
- Customizable layout with splits and tabs

### Neogit Workflow

1. Open status: `<space>gg`
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
2. Use `<space>gs` to stage individual hunks
3. Use `<space>gp` to preview before staging
4. Use `<space>gg` to commit

### Reviewing branch changes
1. Use `<space>gv` to open diffview
2. Navigate files in left panel
3. Review diffs in main panel
4. Close with `<space>gc` or `q`

### Complex operations
1. Use `<space>gg` to open Neogit for complex operations
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
- Preview (`<space>gp`) before staging to avoid mistakes

### Viewing Diffs
- `<space>gd` shows working tree changes
- `<space>gD` shows staged changes (--cached)
- `<space>gv` is best for reviewing multiple files

### Blaming Code
- `<space>gb` shows blame for current line
- `<space>gB` shows full commit information
- Useful with blame lines in blame-mode for understanding history

