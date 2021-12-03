Plug 'neovim/nvim-lspconfig'

function LspConfig()
lua << EOF
-- Rust
require'lspconfig'.rls.setup{capabilities=capabilities}
EOF
endfunction

augroup LspConfig
    autocmd!
    autocmd User PlugLoaded call LspConfig()
augroup END
