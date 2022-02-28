set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'powerline/powerline'
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'preservim/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'takac/vim-hardtime'
Plugin 'tpope/vim-fugitive'
Plugin 'romainl/vim-cool'
Plugin 'qxxxb/vim-searchhi'

" Programming Support
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
" Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'neoclide/coc.nvim'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'

" Theme
Plugin 'Badacadabra/vim-archery'
Plugin 'arcticicestudio/nord-vim'

" Golang Support
" Plugin 'fatih/vim-go'

call vundle#end()            

" Basic configuration
filetype plugin indent on    
syntax on
set nowrap
set encoding=utf8
set showtabline=2
set laststatus=2
set cmdheight=1
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set number 
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set tabstop=8
set shiftwidth=8
set smarttab
set cursorline
set incsearch
set hlsearch
set mouse=a
set ignorecase
set smartcase
set clipboard=unnamedplus
set mouse=a
set wildmenu
set wildmode=full

" Theme configuration
set termguicolors
set background=dark
colorscheme archery

" Ctrlp configuration
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" NERDTree configuration
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" Tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ALE configuration
"let b:ale_fixers = ['prettier', 'eslint'] 
"let g:ale_completion_enabled = 0

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Supertab configuration
let g:SuperTabDefaultCompletionType = "<c-n>"

" Rainbow configuration
let g:rainbow_active = 1

" Session configuration
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0

" Vim-hardtime configuration
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1

" Golang configuration
" let g:go_def_mapping_enabled = 0

" Mapping
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" nmap <C-Tab> :tabn<CR>
" nmap <C-S-Tab> :tabp<CR>
" nmap <C-t> :tabnew<CR>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeFind<CR>
nmap <F4> :TagbarToggle<CR>
nmap <C-k> gcc
" nnoremap <esc> :noh<return>

" Autostart
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


