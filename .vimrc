" ==========================================================================
" CLASSIC VIM SAVAGE CONFIG: GRUVBOX, LSP (C/C++/PY), GIT, TELESCOPE-ISH
" ==========================================================================

" --- AUTO-INSTALL VIM-PLUG ---
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Appearance & Theme
Plug 'morhetz/gruvbox'

" Git Integration (The absolute best for Vim)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File Navigation (Fuzzy Finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocomplete & LSP (The most 'Savage' engine for C/Python)
" This needs Node.js installed: sudo pacman -S nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" --- BASIC SETTINGS ---
syntax on
set termguicolors
colorscheme gruvbox
set background=dark
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set noswapfile " Because we don't fear crashes
let mapleader = " "

" --- KEYBINDINGS ---
" Files & Search (Fast as hell)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>

" Git
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :GitgutterPreviewHunk<CR>

" --- LSP (coc.nvim) CONFIG FOR C/PYTHON ---
" Use <Tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Go to definition / Hover documentation
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" --- AUTO-INSTALL LSP SERVERS ---
let g:coc_global_extensions = ['coc-pyright', 'coc-clangd', 'coc-json']
