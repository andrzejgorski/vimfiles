map <C-x> I# <esc>
runtime! debian.vim

map <F3> :call whylog#Whylog_Action()<CR>
map <F4> :call whylog#Whylog_Teach()<CR>
map <F5> :call whylog#Python_Path()<CR>

runtime plugin/sensible.vim
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
call pathogen#infect()
syntax enable
let g:syntastic_python_checkers=['pep8']
execute pathogen#infect()
syntax on

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ExtraWhitespace /\s\+$\| \+\ze\t/
match ExtraWhitespace /[^\t]\zs\t\+/
match ExtraWhitespace /^\t*\zs \+/
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
let bp="import ipdb; ipdb.set_trace()"

vmap <C-a> I# <esc>
vmap <C-d> I<del><esc>

map <C-b> <esc>oimport ipdb; ipdb.set_trace()<esc>
map <C-k> <esc>Oimport ipdb; ipdb.set_trace()<esc>
map <C-y> <esc>:NERDTree<esc>
map <C-l> <esc>:e <esc>
imap <C-y> <esc>:NERDTree<esc>
imap jkl; <Esc>
imap asdf <Esc>
imap fdsa <Esc>
imap ;lkj <Esc>
" map CTRL-E to end-of-line (insert mode)

imap <C-e> <esc>$i<right>

" map CTRL-A to beginning-of-line (insert mode)

imap <C-a> <esc>0i

" show long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"
match OverLength /\%80v.\+/
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

"set colorcolumn=81
" highlight ColorColumn ctermbg=darkyellow

" vundle {{{1

" needed to run vundle (but i want this anyways)
set nocompatible
filetype off
 
" vundle needs filtype plugins off
" i turn it on later
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
" Plugin 'gmarik/Vundle.vim'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'Valloric/YouCompleteMe'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean

" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
" Plugin 'bling/vim-airline'

" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on
filetype plugin indent on
syntax on

" Auto-check file for errors on write:
let g:PyFlakeOnWrite = 1

let g:PyFlakeCheckers = 'pep8,mccabe,frosted'

let g:PyFlakeDefaultComplexity=10

let g:PyFlakeDisabledMessages = 'E501'

let g:PyFlakeAggressive = 0

let g:PyFlakeCWindow = 6

let g:PyFlakeSigns = 1

let g:PyFlakeSignStart = 1

let g:PyFlakeMaxLineLength = 100

let g:PyFlakeRangeCommand = 'Q'
autocmd BufNewFile,BufRead *.py set foldmethod=indent
set mouse=a
let g:SimpylFold_docstring_preview=1

"python with virtualenv support
py << EOF
import os.path
activate_this = os.path.join('/home/andrzej/.virtualenvs/whylog', 'bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))
EOF

" vim2hs files
" let g:haskell_conceal_wide = 1
