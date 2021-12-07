vim.cmd('colorscheme molokai')

-----------------------------------------------------------------
-- settings
-----------------------------------------------------------------
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.hidden = true

vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.title = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.mouse = 'a'
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6

vim.opt.joinspaces = false
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.exrc = true
-- vim.opt.backup = true
-- vim.opt.backupdir = '~/.local/share/nvim/backup/'
-- vim.cmd('set backupdir = "~/.local/share/nvim/backup//"')
vim.opt.updatetime = 300
vim.opt.redrawtime = 10000

vim.opt.modelines = 0
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.path:append('.,**')

vim.opt.colorcolumn = '90'


-----------------------------------------------------------------
-- key remapping
-----------------------------------------------------------------

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<leader>/', ':noh<cr>', { noremap = true })

vim.api.nvim_set_keymap('i', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F1>', '<ESC>', { noremap = true })

vim.api.nvim_set_keymap('n', 'L', ':tabn<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'H', ':tabp<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })


-----------------------------------------------------------------
-- plugins
-----------------------------------------------------------------

vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/which-key.vim
call plug#end()

doautocmd User PlugLoaded
]])

-- comment
