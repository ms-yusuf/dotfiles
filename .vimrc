set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

	" Utility
" Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" NERDTree
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Search and Replace
Plugin 'qxxxb/vim-searchhi'
Plugin 'romainl/vim-cool'
Plugin 'tpope/vim-abolish' " better search and replace
" File Finder
Plugin 'ctrlpvim/ctrlp.vim'
" GIT
Plugin 'tpope/vim-fugitive'
Plugin 'APZelos/blamer.nvim'
" Registers
Plugin 'junegunn/vim-peekaboo'
" etc
Plugin 'preservim/tagbar'
Plugin 'xolox/vim-misc' " required for xolox's plugins
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-reload'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'roman/golden-ratio'

	" Programming Support
" Languages Pack
Plugin 'sheerun/vim-polyglot'
" Syntax Checking
Plugin 'vim-syntastic/syntastic'
" Auto Complete
Plugin 'neoclide/coc.nvim'
" Highlighter
Plugin 'luochen1990/rainbow' " brackets
" Golang Support
Plugin 'fatih/vim-go'
" PHP
Plugin 'yaegassy/coc-intelephense'
Plugin 'yaegassy/coc-blade'
" Plugin 'jwalton512/vim-blade'
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'phpactor/phpactor'
" HTML, CSS
Plugin 'neoclide/coc-html'
Plugin 'neoclide/coc-css'
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
" Tags, brackets
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
" etc
Plugin 'tpope/vim-commentary'
Plugin 'neoclide/coc-json'
Plugin 'Yggdroot/indentLine'

	" Theme
Plugin 'Badacadabra/vim-archery'
Plugin 'arcticicestudio/nord-vim'
Plugin 'haishanh/night-owl.vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'EdenEast/nightfox.nvim'
Plugin 'romainl/Apprentice'

call vundle#end()

" Basic configuration
filetype plugin indent on
" syntax on
syntax enable
set nowrap
set encoding=utf-8
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
set tabstop=4
set shiftwidth=4
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
set guifont=FiraCode\ Nerd\ Font\ Medium\ 14

" Theme & Status line configuration
set termguicolors
set background=dark
colorscheme night-owl
let g:airline_theme = 'archery'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Cursor configuration
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Ctrlp configuration
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\vendor'
" let g:ctrlp_cmd = 'CtrlPMixed'

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

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'


let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" NERDTrees File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFlags
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFlags,html
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFlags

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts=1
set conceallevel=3
" let g:NERDTreeGitStatusConcealBrackets=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_conceal_nerdtree_brackets=1
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Vim-better-whitespace configuration
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" COC configuration
let b:coc_disabled_sources = ['around', 'buffer' , 'file']

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rainbow configuration
let g:rainbow_active = 1

" Session configuration
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0

" Vim-searchhi configuration
let g:searchhi_clear_all_autocmds = 'InsertEnter'
let g:searchhi_update_all_autocmds = 'InsertLeave'

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
" COC, tab trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" COC, end tab trigger
cmap w!! w !sudo tee % >/dev/null



" Autostart
autocmd StdinReadPre * let s:std_in=1

" functions
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

