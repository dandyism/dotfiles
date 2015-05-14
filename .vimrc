set nocompatible
set backspace=indent,eol,start
syntax on

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'csv.vim'
"NeoBundle 'wmgraphviz'
NeoBundle 'vim-coffee-script'
"NeoBundle 'Flex-4'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
NeoBundle 'morhetz/gruvbox'
"NeoBundle 'bling/vim-airline'
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
"NeoBundle 'VimFootnotes'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'EasyMotion'

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
"set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#eclim#enabled = 1

" Powerline
set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Hightlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
