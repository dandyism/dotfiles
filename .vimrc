set nocompatible
set backspace=indent,eol,start
syntax on

set runtimepath+=~/.vim/bundle/Vundle.vim
filetype off " required!
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'csv.vim'
"Plugin 'wmgraphviz'
Plugin 'vim-coffee-script'
"Plugin 'Flex-4'
Plugin 'ervandew/supertab'
Plugin 'ultisnips'
Plugin 'vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'surround.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-speeddating'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'MatchTag'
Plugin 'utl.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'farseer90718/vim-taskwarrior'
"Plugin 'VimFootnotes'
Plugin 'mtth/scratch.vim'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-jade'
"Plugin 'vimoutliner/vimoutliner'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'EasyMotion'

call vundle#end()
filetype plugin indent on

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

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" YouCompleteMe + UtliSnips via supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

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

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#eclim#enabled = 1
