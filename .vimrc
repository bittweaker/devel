"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Prasad S. Athawale
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required Plugins
" Install the following plugins:
" git
" taglist
" MinibufExplorer
" pymode
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Config - columns, indentation, scrolling, folding etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set background=dark
set title
set nowrap

" Always create windows of equal size, and ensure that horizontally.
set equalalways
set eadirection=hor

" folding
set foldenable
set foldlevel=1
set foldmethod=syntax

" backup
set backup
set backupcopy=auto
set backupdir=~/.vim/backup,/tmp

" Scroll 3 lines at a time
set scrolloff=3

" Longer history
set history=1000

" Change the leader key
let mapleader = ","

" width to 79 characters
set textwidth=79
set colorcolumn=79

" Jump to matching brace briefly
set showmatch

" Extend matching
runtime macros/matchit.vim

" Visual bell
set visualbell

" Show command in the status
set showcmd

" Filetype options
filetype on
filetype plugin on
filetype indent on

set autoindent
set smartindent
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
    syntax on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better searching, use case-sensitive if search has upper case
set ignorecase
set smartcase

" Highlighting search terms
set hlsearch
set incsearch

" Switch off highlighting temporarily
nmap <silent> <leader>n :silent :nohlsearch<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>c :silent :set spell<CR>
nmap <silent> <leader>C :silent :set nospell<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags config
set tags=./tags;
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up tabstop at 2 and setup 2 spaces for tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Catch Trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minibuf Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibuf explorer config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"Stuff for miniBufExplorer.
let g:miniBufExplMaxHeight=3
let g:miniBufExplMinHeight=3

" Map key F4 to resize the mini-buf window at the top to 3 lines.
map <F4> <C-Up> <ESC>: res 3 <ESC> <C-Down> <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python auto-complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Python Mode config
" Disable pylint checking every save
let g:pymode_lint_write = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Force 2 space indentation for python
au FileType python setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag List Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map key F3 to toggle Taglist on and off
map <F3> <Esc>:TlistToggle<CR>

" Open Taglist on the right window.
let Tlist_Use_Right_Window   = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use leader(,)n to open NERDTree.
nnoremap <leader>n :NERDTree .<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable proto syntax highlighting. proto.vim needs to be in ~/.vim/syntax
" Obtain from: http://code.google.com/p/protobuf/source/browse/trunk/editors/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable thrift syntax highlighting. thrift.vim needs to be in ~/.vim/syntax
" Obtain from: https://github.com/sprsquish/thrift.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim
augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

