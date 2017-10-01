set nocompatible


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'tomlion/vim-solidity'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/macros/matchit.vim



"Remove toolbar
set guioptions-=T

set ignorecase
colorscheme desert

if exists("syntax_on")
  syntax reset
endif

set history=500
set wildmenu
set wildignore=*.o,*.obj,*.exe,*.a

"set initial window size
"set lines=65
"set columns=90

"font setup
"set guifont=Lucida_Console:h8:cANSI
set guifont=Monospace\ 10
"set guifont=Ubuntu\ Mono\ 8
"set guifont=Liberation\ Mono\ 9

set autowrite
set expandtab
set tabstop=4
set shiftwidth=4
set showmatch
set nobackup
set nu


" for python perhaps?
set autoindent

set list listchars=tab:\|_,trail:.

set noundofile

"Ctrl-e opens up folder which current file is in
map <C-e>  :!start explorer %:p:h:gs?\/?\\\\\\?<CR>


" Auto Bracket
"inoremap ( (<SPACE><SPACE>)<LEFT><LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
"inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

 
 
" Turn off auto comment for C and C++ when you hit ENTER
au FileType c,cpp set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
 
" Toggle buffers back and forth
map <tab> :bp<cr>
map <s-tab> :bn<cr>
 
" Newtab
map <C-T> :tabnew<cr>
 
" Switch to next Tab
map <C-N> :tabnext<cr>
 
" Close current tab
map <C-D> :tabclose<cr>
 
" Edit and Load _vimrc
:nmap ,s :source $VIM/_vimrc<CR>
:nmap ,e :e $VIM/_vimrc<CR>
 
" Toggle Line numbers
map ,n :set nu!<CR>



 
" Quick Comment blocks //, and /* ... */
"map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
"map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
":vmenu PopUp.Comments.//\ Add  :s/^/\/\//<CR>:nohlsearch<CR>
":vmenu PopUp.Comments.//\ Remove  :s/^\/\///<CR>:nohlsearch<CR>
 
":vmenu PopUp.Comments./*\ */\ Add :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
 
" Tip #271: easy (un)commenting out of source code
" Un/Comment using /* ... */
function! Komment()
if getline(".") =~ '\/\*'
let hls=@/
s/^\/\*//
s/*\/$//
let @/=hls
else
let hls=@/
s/^/\/*/
s/$/*\//
let @/=hls
endif
endfunction
 
map ,* :call Komment()<CR>:nohlsearch<CR>
 
" Un/Comment using //
function! KommentSlash()
if getline(".") =~ '\/\/'
let hls=@/
s/^\/\///
let @/=hls
else
let hls=@/
s/^/\/\//
let @/=hls
endif
endfunction
 
map ,/ :call KommentSlash()<CR>:nohlsearch<CR>
 
" Un/Comment using # - for perl
function! KommentPound()
if getline(".") =~ '\#'
let hls=@/
s/^\#//
let @/=hls
else
let hls=@/
s/^/\#/
let @/=hls
endif
endfunction
 
map ,# :call KommentPound()<CR>:nohlsearch<CR>
 
" Un/Comment using # - for perl
function! KommentSemiColon()
if getline(".") =~ '\;'
let hls=@/
s/^\;//
let @/=hls
else
let hls=@/
s/^/\;/
let @/=hls
endif
endfunction
 
map ,; :call KommentSemiColon()<CR>:nohlsearch<CR>
 
" Displays the name of the currently displayed function
map \func :let name = FunctionName()<CR> :echo name<CR>
 
" Highlighting whitespaces at end of line
highlight WhitespaceEOL ctermbg=yellow guibg=yellow
match WhitespaceEOL /\s\+$/
 
" Check for extra spaces instead of tabs at the front of the line
match WhitespaceEOL /^\ \+/
 
" Highlight redundant whitespaces.
highlight RedundantSpaces ctermbg=white guibg=white
match RedundantSpaces /\s\+$\| \+\ze\t/ 
 
"auto complete strings
"iab #i   #include
"iab #d   #define
"iab  s   static
"iab en   enum
"iab fl   float
"iab  v   void
"iab  r   return
"iab cl   class
"iab el else
"iab str string
