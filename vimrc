" VIM Configuration File

" disable vi compatibility
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'ledger/vim-ledger'
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

let g:EclimCompletionMethod = 'omnifunc'

" Set Colorscheme
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Enable Tagbar with F8
nmap <F8> :TagbarToggle<CR>

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Misc Settings
set undolevels=10000  " set number of undo levels
set history=10000     " mucho levels of history
set autoread          " Set to auto read when a file is changed from the outside
set showcmd           " show command in bottom bar
set ruler             " always display status line
set laststatus=2      " always display status line
set mouse=a           " allow use of the mouse
set nobackup          " this is not the 70's we don't need backups
set noswapfile        " disable swap files
set viewoptions=folds,options,cursor,unix,slash " Better compatibility
" use semicolon as another colon
noremap ; :
" ignore typos
command WQ wq
command Wq wq
command W w
command Q q

" configure tabwidth and insert spaces instead of tabs and indentation
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set softtabstop=2    " let backspace delete indent
set expandtab        " expand tabs to spaces
set autoindent       " use indentation of previous line
set smartindent      " use intelligent indentation for C
set nowrap           " don't wrap lines
set pastetoggle=<F2> " <F2> to toggle auto-indentation when pasting in text
set backspace=2      " make backspace work like most other apps
set backspace=indent,eol,start

" lines
set number           " turn line numbers on
highlight LineNr ctermfg=grey
set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40
" 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
call matchadd('OverLength', '\%81v', 100)
set colorcolumn=80
set textwidth=80
" https://superuser.com/q/1502878
set nojoinspaces

" Searching
set hlsearch         " highlight when searching
set incsearch        " match while searching
set ignorecase       " case insensitive search
set smartcase        " smart case search
" space to clear search highlights
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Better search match visualization
function! HLNext (blinktime)
    highlight BlackOnBlack ctermfg=black ctermbg=black
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let hide_pat = '\%<'.lnum.'l.'
            \ . '\|'
            \ . '\%'.lnum.'l\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
            \ . '\|'
            \ . '\%>'.lnum.'l.'
    let ring = matchadd('BlackOnBlack', hide_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 350) . 'm'
    call matchdelete(ring)
    redraw
endfunction
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" highlighting
syntax on            " turn syntax highlighting on
set showmatch        " highlight matching braces
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Google File Extensions
au BufNewFile,BufRead *.pi setf python

" window settings
set splitright       " Puts new vsplit windows to the right of the current
set splitbelow       " Puts new split windows to the bottom of the current
set lazyredraw       " Don't redraw while executing macros

" Key Commands
" <F5> to remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

map <leader>l :setlocal number!<cr>

" session saving
set viminfo^=%       " Remember info about open buffers on close
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
\ endif

