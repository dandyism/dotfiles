set nocompatible
set backspace=indent,eol,start
syntax on

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'csv.vim'
NeoBundle 'vim-coffee-script'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'MatchTag'
NeoBundle 'utl.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'farseer90718/vim-taskwarrior'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'EasyMotion'
NeoBundle 'Shougo/neocomplete.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" Searching
set ignorecase
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" Unite.vim
call unite#custom#source('file_rec/async', 'ignore_pattern', join([
      \ "\.git/",
      \ "bower_components/",
      \ "node_modules/"
      \ ], '\|'))
nnoremap <C-p> :Unite -start-insert -auto-resize tab:no-current file_rec/async<cr>

" CSV
let g:csv_delimiter = ','
let g:csv_nl = 1

" GUI
if has("gui_running")
  set guioptions-=T
  set guifont=Inconsolata\ 12
endif

set t_Co=256
set background=dark
colo gruvbox

" Editing
set  number
noremap j gj
noremap k gk
noremap gj j
noremap gk k
set linebreak
set switchbuf=usetab,newtab

" Indenting
set shiftround
set tabstop=2 shiftwidth=2 expandtab autoindent

" Dictionaries
set dict=/usr/share/dict/american-english-huge

" UTL
map gf :Utl<CR>

" Leader
let mapleader = ","

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Auto Mkdir
au BufWrite * :exe ': !mkdir -p ' . escape(fnamemodify(bufname('%'),':p:h'),'#% \\')

" Knowledgebase
function OpenKnowledgebase()
  cd ~/knowledgebase
  e index.txt
endfunction

map <Leader>kb :call OpenKnowledgebase()<CR>

" Gundo
let g:gundo_right = 1

" Scroll offset
set scrolloff=5

" Powerline
set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Hightlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
