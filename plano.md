Plano: Migração Neovim para LSP Nativo (TypeScript/Next.js)

Objetivo: migrar do fluxo atual com CoC para LSP nativo com ganho imediato de produtividade, mantendo sua experiência próxima do VS Code e minimizando risco com rollout em etapas.

Fase 0: Baseline e Segurança

Congelar estado atual dos atalhos e comportamento de edição.
Confirmar pontos críticos existentes:
Autoformat global no save em init.lua:84 e init.lua:87.
CoC ativo em plugins.lua:7.
Neoformat ativo em plugins.lua:21.
Conflito de Tab/Shift-Tab entre completion e bufferline em cocvim.lua:20, cocvim.lua:35, bufferline.lua:73, bufferline.lua:74.
Config Biome ainda curta para TS/TSX em biome.jsonc:2.
Fase 1: Introduzir Stack LSP Nativo sem remover CoC

Atualizar plugins.lua para incluir:
neovim/nvim-lspconfig
williamboman/mason.nvim
williamboman/mason-lspconfig.nvim
hrsh7th/nvim-cmp
hrsh7th/cmp-nvim-lsp
L3MON4D3/LuaSnip
rafamadriz/friendly-snippets
Manter CoC temporariamente ativo como fallback durante validação.
Criar novo módulo de setup LSP em lua/config/lsp.lua.
Criar novo módulo de completion/snippets em lua/config/cmp.lua.
Incluir os novos requires em init.lua sem desmontar imediatamente o setup anterior.
Fase 2: Configuração Técnica de LSP para TS/Next

No módulo de LSP:
Configurar capabilities via cmp_nvim_lsp.
Subir servidor TypeScript (preferência por vtsls; fallback tsserver).
Definir keymaps de produtividade:
gd definição
gr referências
K hover
líder + rn rename
líder + ca code action
Configurar diagnóstico com sinais e navegação de erros.
No módulo de CMP:
Priorizar fontes LSP + snippets.
Comportamento de Tab/Shift-Tab restrito a completion/snippet no insert mode.
Enter confirma item de completion quando menu estiver visível.
Fase 3: Resolver Conflitos de UX Imediatos

Ajustar bufferline.lua para remover colisão com Tab.
Remapear navegação de buffers para atalhos sem conflito, por exemplo Ctrl+h e Ctrl+l ou líder+[, líder+].
Garantir que Tab/Shift-Tab fiquem exclusivos do completion no insert mode.
Revisar cocvim.lua para não manter mapeamentos que conflitem com a camada nova.
Fase 4: Formatação e Lint Previsíveis com Biome

Expandir biome.jsonc para escopo real de Next:
TypeScript/TSX
JSON
CSS
Linter habilitado com recommended.
Em init.lua, substituir autoformat global por regra segmentada por filetype web:
ts
tsx
js
jsx
json
css
Evitar formatar arquivos fora desse escopo automaticamente.
Fase 5: Experiência VS Code-like

Garantir paridade das ações mais usadas no dia a dia:
Rename
Code Action
Organize Imports
Go to Definition
Find References
Hover
Adicionar visualização de diagnósticos mais clara, com quickfix ou plugin de painel de diagnostics.
Habilitar snippets React/Next para reduzir boilerplate em componentes, hooks e páginas.
Fase 6: Remoção Gradual de CoC

Rodar validação funcional completa em projeto TS/Next real.
Confirmar que nenhuma ação de produtividade depende de CoC.
Remover CoC de plugins.lua:7.
Descontinuar referência de CoC em init.lua e aposentar cocvim.lua.
Executar novo ciclo de validação final.
Arquivos que serão alterados

plugins.lua
init.lua
bufferline.lua
biome.jsonc
cocvim.lua durante transição e depois remoção
Arquivos novos previstos

lua/config/lsp.lua
lua/config/cmp.lua
Checklist de Verificação Técnica

Rodar Lazy sync e checkhealth no Neovim.
Confirmar instalação do servidor TS pelo Mason.
Abrir arquivo ts e tsx e validar:
definição
referências
hover
rename
code action
Validar completion e snippets com Tab e Shift-Tab em insert mode.
Validar formatação ao salvar em ts, tsx, json e css.
Verificar ausência de regressão de atalhos de navegação de buffers.
Rodar 1 a 2 sessões reais de uso antes de remover fallback.
Critérios de Aceite

Produtividade em TS/Next igual ou melhor que antes.
Sem conflito de teclas entre completion e bufferline.
Formatação consistente em escopo web, sem efeitos colaterais fora dele.
Nenhuma dependência funcional de CoC após remoção.
Estratégia de Rollback

Se faltar recurso crítico de produtividade, reativar CoC temporariamente.
Ajustar lsp/cmp e keymaps.
Repetir validação e tentar remoção novamente no ciclo seguinte.