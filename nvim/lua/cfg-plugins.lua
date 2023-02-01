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

return require('packer').startup(function(use)
    -- packer
    use {'wbthomason/packer.nvim'}
    -- fzf
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}
    use {'stsewd/fzf-checkout.vim'}
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
