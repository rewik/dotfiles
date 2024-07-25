local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.api.nvim_create_user_command(
    'HelpLocal',
    function(opts)
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
        local width = vim.api.nvim_get_option("columns")
        local height = vim.api.nvim_get_option("lines")
        local win_height = math.ceil(height * 0.8 - 4)
        local win_width = math.ceil(width * 0.8)

        local win_x = math.ceil((width - win_width) / 2)
        local win_y = math.ceil((height - win_height) / 2)

        local opts = {
            style = "minimal",
            relative = "editor",
            width = win_width,
            height = win_height,
            row = win_y,
            col = win_x,
            border = "rounded",
        }

        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.api.nvim_win_set_option(win, "cursorline", true)

        vim.api.nvim_buf_set_lines(buf,0,0,false,
            {"Helpful commands:",
             ":PackerStatus",
             "  - check status of packer (packages)",
             "",
             ":COQnow",
             "  - enable code completion",
             "",
             "<l>b / <l>r / <l>R",
             "  - list buffers / search buffers / search files?"
            }
        )
    end,
    { nargs = 0 }
)

return require('packer').startup(function(use)
    -- packer
    use {'wbthomason/packer.nvim'}
    -- fzf
    use {'junegunn/fzf', run = "./install --bin"}
    use {'ibhagwan/fzf-lua'}
    -- lightline
    use {'itchyny/lightline.vim'}
    -- which-key
    use {'folke/which-key.nvim', config=function()
        require('which-key').setup {}
    end}
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run=":TSUpdate"}
    -- colorschemes
    use 'Mofiqul/adwaita.nvim'
    -- completion
    use {'ms-jpq/coq_nvim',
        ft = {'rust','c','bash','cpp','python'},
        cmd = 'COQnow',
        config = 'vim.cmd[[COQnow]]'
    }

    -- lspconfig
    use 'neovim/nvim-lspconfig'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
