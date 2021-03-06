set nocompatible
set backspace=indent,eol,start
syntax on

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

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
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'csv.vim'
NeoBundle 'vim-coffee-script'
NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'MatchTag'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'parkr/vim-jekyll'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'marijnh/tern_for_vim', {'build': {'linux': 'npm install'}}
NeoBundle 'junegunn/vim-easy-align'
<<<<<<< Updated upstream
NeoBundle 'aklt/plantuml-syntax'
=======
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'wannesm/wmgraphviz.vim'
NeoBundle 'yuratomo/flex-api-complete'
NeoBundle 'clones/vim-flash'
NeoBundle 'rking/ag.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vimwiki/vimwiki', 'dev'
NeoBundle 'rking/ag.vim'
>>>>>>> Stashed changes

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" Actionscript + MXML
au BufNewFile,BufRead *.as    setl omnifunc=flexapi#complete
au BufNewFile,BufRead *.mxml  setf xml
au BufNewFile,BufRead *.mxml  setl omnifunc=mxml#complete

au CompleteDone *.as          call flexapi#showRef()

if has("balloon_eval") && has("balloon_multiline")
  au BufNewFile,BufRead *.as  setl bexpr=flexapi#balloon()
  au BufNewFile,BufRead *.as  setl ballooneval
endif

" Searching
if executable('ag')
  set ignorecase
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" Unite.vim
let g:unite_force_overwrite_statusline = 0
call unite#custom#source('file_rec/async', 'ignore_pattern', join([
      \ "\.git/",
      \ "bower_components/",
      \ "node_modules/"
      \ ], '\|'))
nnoremap <C-p> :Unite -start-insert -buffer-name=files -wipe -no-resize -no-split tab:no-current file_rec/async:!<CR>

" CSV
let g:csv_delimiter = ','
let g:csv_nl = 1

" GUI
if has("gui_running")
  set guioptions=fgp
  set guifont=Terminus\ 11
endif

set t_Co=256
set background=dark
colo zazen

set  number
noremap j gj
noremap k gk
noremap gj j
noremap gk k
set linebreak
set switchbuf=usetab,newtab

" Indenting
set shiftround
set tabstop=4 shiftwidth=4 expandtab autoindent

" Dictionaries
set dict=/usr/share/dict/american-english-huge

" Leader
let mapleader = ","

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1
call neocomplete#custom#source('buffer', 'disabled', 1)
<<<<<<< Updated upstream
=======

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\%(\h\w*\|)\)\.\w*'
>>>>>>> Stashed changes

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Auto Mkdir
au BufWrite * :exe ': !mkdir -p ' . escape(fnamemodify(bufname('%'),':p:h'),'#% \\')

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

" Startify
if and(executable('fortune'), executable('cowsay'))
  let g:startify_custom_header =
    \ map(split(system('fortune -s | cowsay -n'), '\n'), '"   ". v:val') + ['','']
endif

" Use control + movement keys for easier motion between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Syntastic
let g:syntastic_check_on_open = 1

" vimfiler
let g:vimfiler_as_default_explorer = 1

" Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap <Enter> <Plug>(EasyAlign)
