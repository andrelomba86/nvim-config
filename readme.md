# Atalhos configurados no Neovim

Este arquivo lista os atalhos adicionados pelas configuracoes atuais.

## Convencoes

- `<leader>` = `\\`
- Modos:
  - `n` = normal
  - `i` = insert
  - `s` = select (snippets)

## LSP (arquivo: `lua/config/lsp.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `gd` | Ir para definicao |
| n | `gr` | Listar referencias |
| n | `K` | Hover/documentacao |
| n | `<leader>rn` | Rename do simbolo |
| n | `<leader>ca` | Code actions (modo rapido, com timeout curto e filtro para TS/JS) |
| n | `<leader>cA` | Code actions completas (timeout maior) |
| n | `<leader>oi` | Organize imports |
| n | `[d` | Ir para diagnostico anterior |
| n | `]d` | Ir para proximo diagnostico |
| n | `<leader>q` | Enviar diagnosticos para loclist |
| n | `<leader>xx` | Abrir/fechar painel de diagnosticos (Trouble) |

## Completion e snippets (arquivo: `lua/config/cmp.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| i, s | `<C-Space>` | Abrir menu de completion |
| i, s | `<CR>` | Confirmar item selecionado (quando menu visivel) |
| i, s | `<Tab>` | Proximo item no completion ou avancar snippet |
| i, s | `<S-Tab>` | Item anterior no completion ou voltar snippet |

## Navegacao de buffers (arquivo: `lua/config/bufferline.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `<C-l>` | Proximo buffer |
| n | `<C-h>` | Buffer anterior |

## NvimTree (arquivo: `lua/config/nvimtree.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `<leader>e` | Focar/fechar NvimTree |
| n | `<leader><leader>f` | Revelar arquivo atual na tree |
