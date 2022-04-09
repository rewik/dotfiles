Plug 'neovim/nvim-lspconfig'

function LspConfig()
lua << EOF
local lsp = require "lspconfig"
local servers = {'rls', 'jedi_language_server'}
-- Rust (rustup component add rls rust-analysis rust-src)
-- Python (pip install jedi-language-server)
for _, lsps in pairs(servers) do
    lsp[lsps].setup {
        flags = {
            debounce_text_changes = 150,
        }
    }
end
EOF
endfunction

augroup LspConfig
    autocmd!
    autocmd User PlugLoaded call LspConfig()
augroup END
