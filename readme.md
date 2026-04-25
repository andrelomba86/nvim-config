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
| n | `<leader>f` | Formatar arquivo (LSP primeiro, fallback para Neoformat) |
| n | `<leader>ca` | Code actions (modo rapido, com timeout curto e filtro para TS/JS) |
| n | `<leader>cA` | Code actions completas (timeout maior) |
| n | `<leader>cf` | Apenas quickfix code actions |
| n | `<leader>cr` | Apenas refactors |
| n | `<leader>cs` | Apenas source actions |
| n | `<leader>oi` | Organize imports |
| n | `[d` | Ir para diagnostico anterior |
| n | `]d` | Ir para proximo diagnostico |
| n | `<leader>q` | Enviar diagnosticos para loclist |
| n | `<leader>xx` | Abrir/fechar diagnosticos do workspace |
| n | `<leader>xX` | Abrir/fechar diagnosticos do buffer atual |
| n | `<leader>xq` | Abrir/fechar quickfix no Trouble |
| n | `<leader>xl` | Abrir/fechar loclist no Trouble |

## Completion e snippets (arquivo: `lua/config/cmp.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| i, s | `<C-Space>` | Abrir menu de completion |
| i, s | `<CR>` | Confirmar item selecionado (quando menu visivel) |
| i, s | `<Tab>` | Proximo item no completion ou avancar snippet |
| i, s | `<S-Tab>` | Item anterior no completion ou voltar snippet |

Comportamento adicional:

- Completion com bordas, janela de documentacao e ghost text para ficar mais proximo do VS Code.
- Autopairs integrado ao completion: ao confirmar sugestoes de funcoes/metodos, parenteses sao inseridos automaticamente.

## Navegacao de buffers (arquivo: `lua/config/bufferline.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `<C-l>` | Proximo buffer |
| n | `<C-h>` | Buffer anterior |

## Comentarios (arquivo: `lua/config/comment.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n, x | `<C-_>` | Alternar comentario (estilo Ctrl+/) |
| n, x | `<leader>/` | Alternar comentario (fallback de terminal) |

## Git (arquivo: `lua/config/gitsigns.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `]h` | Proximo hunk |
| n | `[h` | Hunk anterior |
| n | `<leader>hs` | Stage hunk |
| n | `<leader>hr` | Reset hunk |
| n | `<leader>hp` | Preview hunk |
| n | `<leader>hb` | Alternar blame da linha atual |

## NvimTree (arquivo: `lua/config/nvimtree.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `<leader>e` | Abrir explorer focando no arquivo atual (ou fechar se ja estiver aberto) |
| n | `<leader><leader>f` | Revelar arquivo atual na tree |

Comportamento adicional:

- Explorer sincroniza automaticamente o arquivo em foco (estilo VS Code).

## Busca e navegacao de workspace (arquivo: `lua/config/telescope.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `<leader>p` | Buscar arquivos no projeto |
| n | `<leader>fg` | Buscar texto no projeto (live grep) |
| n | `<leader>fb` | Buscar buffers abertos |
| n | `<leader>fs` | Buscar simbolos no arquivo atual |
| n | `<leader>fS` | Buscar simbolos no workspace |
| n | `<leader>ft` | Buscar TODO/FIXME no workspace |

## TODOs no codigo (arquivo: `lua/config/todo_comments.lua`)

| Modo | Atalho | Acao |
| --- | --- | --- |
| n | `]t` | Ir para proximo TODO/FIXME |
| n | `[t` | Ir para TODO/FIXME anterior |
| n | `<leader>xt` | Abrir painel de TODOs no Trouble |

## Discoverability (arquivo: `lua/config/whichkey.lua`)

- `which-key` habilitado para mostrar painel de atalhos ao usar `<leader>`.
- Grupos configurados: Code, Find/Format, Git Hunks, Diagnostics e Explorer.
