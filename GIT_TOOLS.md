# Git Tools Guide

This document describes the improved git tools integration in this Neovim configuration.

## Overview

The configuration includes three complementary git tools:
1. **Gitsigns** - Inline git status and hunk management
2. **Diffview** - Side-by-side diff viewing
3. **Neogit** - Full-featured git client (Magit-like)

## Gitsigns - Inline Git Status

Gitsigns shows git changes inline in the editor with signs (▶, ~, _, etc.).

### Keymaps

#### Navigation
- `]g` - Next git hunk
- `[g` - Previous git hunk

#### Stage/Reset
- `<leader>gs` - Stage hunk (normal/visual)
- `<leader>gr` - Reset hunk (normal/visual)
- `<leader>gS` - Stage entire buffer
- `<leader>gR` - Reset entire buffer

#### Preview & Blame
- `<leader>gp` - Preview hunk
- `<leader>gb` - Blame line
- `<leader>gB` - Blame line (full, includes commit)

#### Diff
- `<leader>gd` - View git diff of current file
- `<leader>gD` - View git diff (cached/staged)

#### Toggles
- `<leader>gh` - Toggle hunk signs visibility
- `<leader>gw` - Toggle word diff
- `<leader>gl` - Toggle line highlight
- `<leader>gn` - Toggle number highlight
- `<leader>gt` - Toggle current line blame

#### Text Objects
- `ig` - Inside git hunk (visual/operator mode)

## Diffview - Visual Diffs

Diffview provides a split-view for browsing git diffs with file tree and history.

### Keymaps

- `<leader>gv` - Open diffview
- `<leader>gf` - Open file history
- `<leader>gh` - Open repo history (branch)
- `<leader>gc` - Close diffview

### Features
- Tree view of changed files
- Side-by-side diffs
- File history tracking
- Enhanced diff highlighting
- Integrated with gitsigns

## Neogit - Full Git Client

Neogit is a Magit-like git client for complex operations.

### Keymaps

- `<leader>gg` - Open Neogit (main view)
- `<leader>gm` - Open Neogit commit view
- `<leader>gP` - Open Neogit pull dialog
- `<leader>gU` - Open Neogit push dialog

### Features
- Full staging/unstaging interface
- Commit composition
- Branch management
- Merge/rebase handling
- Integrated with Diffview and Telescope
- Magit-like keybindings within the UI

## Keymap Reference

| Key | Tool | Action |
|-----|------|--------|
| `]g`, `[g` | Gitsigns | Navigate hunks |
| `<leader>gs` | Gitsigns | Stage hunk |
| `<leader>gr` | Gitsigns | Reset hunk |
| `<leader>gS` | Gitsigns | Stage buffer |
| `<leader>gR` | Gitsigns | Reset buffer |
| `<leader>gp` | Gitsigns | Preview hunk |
| `<leader>gb` | Gitsigns | Blame line |
| `<leader>gB` | Gitsigns | Blame line (full) |
| `<leader>gd` | Gitsigns | Diff file |
| `<leader>gD` | Gitsigns | Diff (cached) |
| `<leader>gh` | Gitsigns | Toggle signs |
| `<leader>gw` | Gitsigns | Toggle word diff |
| `<leader>gl` | Gitsigns | Toggle line highlight |
| `<leader>gn` | Gitsigns | Toggle num highlight |
| `<leader>gt` | Gitsigns | Toggle line blame |
| `ig` | Gitsigns | Select hunk |
| `<leader>gv` | Diffview | Open diffview |
| `<leader>gf` | Diffview | File history |
| `<leader>gh` | Diffview | Repo history |
| `<leader>gc` | Diffview | Close diffview |
| `<leader>gg` | Neogit | Open Neogit |
| `<leader>gm` | Neogit | Commit view |
| `<leader>gP` | Neogit | Pull dialog |
| `<leader>gU` | Neogit | Push dialog |

## Configuration Files

- `lua/config/gitsigns.lua` - Gitsigns configuration
- `lua/config/diffview.lua` - Diffview configuration
- `lua/config/git.lua` - Git utilities and common functions

## Tips

### Using Hunks
- Stage/reset individual hunks without committing entire file
- Preview changes before staging
- Visual mode allows operating on multiple hunks at once

### Workflow
1. Use `<leader>gd` or `<leader>gD` to see what changed
2. Use `]g`/`[g` to navigate hunks
3. Use `<leader>gs` to stage hunks
4. Use `<leader>gg` or `<leader>gm` to commit

### Advanced
- Use Neogit for complex operations (rebasing, merging)
- Use Diffview for reviewing branch changes
- Use Gitsigns for quick hunk operations
