set nocompatible
let mapleader = ";"
set guifont=Monaco:h18
colorscheme morning
set ignorecase
set encoding=utf-8
set arabicshape
set linebreak
set textwidth=0
set showcmd


"""""""""""" Plugins Work Only """"""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required

"This is for pathogen
"call pathogen#infect()
"for taglist to work
"""""""""""""""""""


" Perfect for programming, pairing " ' ( [ { 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>
map <CR> o<Esc>

set nu

"Copy to clipboard
let @y = '"+y<CR>'
"Cut to clipboard
let @d = '"+d<CR>'
"Paste from clipboard
let @p = '"+p<CR>'

:sign define fixme1 text=!> linehl=Todo texthl=Error 

"---------------json.vim plugin------------------------------

"autocmd BufNewFile,BufRead *.json set ft=javascript
"------------------------------------------------------------

function! SignFixme()
  execute(":sign place 150 line=".line(".")." name=fixme1 file=".expand("%:p"))
endfunction
"highlight the line
map <F6> :call SignFixme()<CR>
map <C-F6> :sign unplace<CR>

"Call python to execute the file
map <F5> :!python %<cr>

"Open .vimrc file
map <f10> :e! ~/.vimrc<CR>

nmap ,w :w<CR>
nmap ,q :q!<CR>
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nmap ,c :set nohlsearch<CR>z-
nmap ,h :hide<CR>
nmap ,e $a
nmap <Space> <PageDown>
nmap ,v <C-w>v<C-w><C-w>:new<CR><C-w>j:hide<CR>
nmap ,n <C-w>w

set arabicshape
"python configuration
autocmd FileType python set omnifunc=pythoncomplete#Complete
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

"C# configuration
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2  
au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m

