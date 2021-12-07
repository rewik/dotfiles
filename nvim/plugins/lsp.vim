Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

function LspConfig()
lua << EOF
local lsp = require "lspconfig"
local coq = require "coq"
-- Rust (rustup component add rls rust-analysis rust-src)
lsp.rls.setup(coq.lsp_ensure_capabilities({capabilities=capabilities}))
-- Python (pip install jedi-language-server)
lsp.jedi_language_server.setup(coq.lsp_ensure_capabilities())
EOF
endfunction

augroup LspConfig
    autocmd!
    autocmd User PlugLoaded call LspConfig()
augroup END
