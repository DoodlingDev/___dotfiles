" INIT {{{

runtime! macros/matchit.vim

set nocompatible " use vim, not vi api
set shell=$SHELL
set encoding=utf-8
set fileencoding=utf-8
let mapleader=" "
nnoremap <leader>rc :tabe<space>$MYVIMRC<cr>

" VUNDLE {{{

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/config/nvim/bundle/Vundle.vim
call vundle#rc("~/.dotfiles/config/nvim/bundle")
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" file management
Bundle 'scrooloose/nerdtree'

" nerdTree and GIT
" Bundle 'Xuyuanp/nerdtree-git-plugin'

" fuzzy search
Bundle 'ctrlpvim/ctrlp.vim'

" Snippets
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Asynchronous Linting
Plugin 'w0rp/ale'

" Rails
Plugin 'tpope/vim-rails'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" comment and uncomment
Bundle 'tomtom/tcomment_vim'

" surround block with quetes etc
Bundle 'tpope/vim-surround'

" work more easily with markdown files
Plugin 'tpope/vim-markdown'

" checks your ruby code
" Plugin 'ngmy/vim-rubocop'

" highlight changes in vim
Plugin 'airblade/vim-gitgutter'

" slim syhtax highlighting
Plugin 'slim-template/vim-slim'

" multi-language support
" Bundle 'vim-polyglot'

" Language Server support
Plugin 'autozimu/LanguageClient-neovim'

" css support
" Bundle 'vim-css3-syntax'

" Javascript highlighting etc
Plugin 'othree/yajs.vim'

" JSX highlighting
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Git plugin and functionality
Plugin 'tpope/vim-fugitive'

" Async completion
Plugin 'Shougo/deoplete.nvim'
" Tern and deoplete
Plugin 'carlitux/deoplete-ternjs'

" Airline statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'godlygeek/csapprox'

" vertical alignment
Plugin 'godlygeek/tabular'

" supertab <TAB> addon
Plugin 'ervandew/supertab'

" easily navigate VIM and TMUX panes
Bundle 'christoomey/vim-tmux-navigator'

call vundle#end()

" }}}

set termguicolors
syntax enable
colorscheme earthsong

set backspace=2
set noswapfile
set history=200
set ruler
set showcmd " show command in status line
set autoread
set autowrite
set incsearch
set foldmethod=marker
set cursorline
set lazyredraw " Don't redraw during macros

" Use one space, not two, after punctuation.
set nojoinspaces

" Softtabs, 2 spaces
set tabstop=2
set smarttab
set shiftwidth=2 " Number of spaces to use in autoindenting
set shiftround
set expandtab
set wrap
set linebreak
set smartindent " Smart autoindenting on new lines
" set nolist  " Show hidden characters?
set formatoptions-=tc

" Make it obvious where 80 chars is
set textwidth=80
set numberwidth=5

" Line numbers and relative line numbers
set number
set relativenumber

" More natural direction when splitting
set splitbelow
set splitright

set diffopt+=vertical

set laststatus=2
set encoding=utf-8

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set mouse=a

set ignorecase

set previewheight=8 " Completion preview height

set clipboard=unnamed

" set cursor offset
:set so=10

" }}}

" DEOPLETE {{{

call deoplete#enable()
" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" }}}

" FILETYPE AUGROUP {{{

filetype on

augroup vimrcEx
  autocmd!

  filetype plugin indent on
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.{jscs,jshint,eslint} set filetype=json
  autocmd BufRead,BufNewFile *.{jsx,es6} set filetype=javascript
  autocmd BufRead,BufNewFile *.spec.js set filetype=javascript
  autocmd BufRead,BufNewFile *.slim set filetype=slim
  autocmd BufRead,BufNewFile *.rb set filetype=ruby
  autocmd BufRead,BufNewFile *.scss set filetype=scss.css
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
augroup END

" }}}

" LINTING {{{

let g:ale_linters = {'javascript': ['prettier', 'eslint']}

" }}}

" PLUGIN CONFIGS {{{

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<S-cr>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit="vertical"

let g:SuperTabDefaultCompletionType = "<c-n>"

if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap <leader>/ :Ag<SPACE>
  endif
endif

" Language Server Config
set hidden

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
  \ }

let g:LanguageClient_autostart = 1

let g:airline_powerline_fonts=1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" airline tab w/ tab number
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

let g:ultisnips_javascript = {
     \ 'keyword-spacing': 'always',
     \ 'semi': 'always',
     \ 'space-before-function-paren': 'never',
     \ }

" }}}

" AUTOCOMMANDS {{{

" turn on line highlight in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" PERSONAL KEYBINDINGS {{{

inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap J 10j
nnoremap K 10k

" better tab switching
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>t :tabe<cr>
nnoremap <leader>t. :tabe<cr>

" Opens a tab edit command with the currently open file filled in
nnoremap <leader>te :tabe<space><C-R>=expand("%:p")<cr>

"stop that stupid window from popping up
map q: :q

" Jump to the end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

inoremap JK <Esc>/-+-<Enter>:noh<Enter>"_3cl

" convert underscore to camel
nnoremap _ f_x~

" indent selection and stay selected
vnoremap > >gv
vnoremap < <gv
vnoremap <space> I<space><esc>gv

" add blank line above
nnoremap [<space> mwO<esc>`w
" add blank line below
nnoremap ]<space> mwo<esc>`w

" source vimrc
nnoremap <leader>src :source<space>$MYVIMRC<cr>

" move selection up
vnoremap <S-k> :move'<--".1<cr>gv
" move selection down
vnoremap <S-j> :move'>+".1<cr>gv

" vim remap <space>
inoremap &<space>. <lt>space>

" snippet ++++ remover
inoremap &++ <lt>esc>?++++<lt>cr>:noh<lt>cr>c4l

" sort and then Tabularize on :
vnoremap <leader>s: :sort<space>u<cr>;Tabularize/:/<cr>

" change next inside ({["''"]})
nnoremap <leader>cn( f(ci(
nnoremap <leader>cN( F(ci(
nnoremap <leader>cn) f)ci)
nnoremap <leader>cN) F)ci)
nnoremap <leader>cn{ f{ci{
nnoremap <leader>cN{ F{ci{
nnoremap <leader>cn} f}ci}
nnoremap <leader>cN} F}ci}
nnoremap <leader>cn[ f[ci[
nnoremap <leader>cN[ F[ci[
nnoremap <leader>cn] f]ci]
nnoremap <leader>cN] F]ci]
nnoremap <leader>cn" f"ci"
nnoremap <leader>cN" F"ci"
nnoremap <leader>cn' f'ci'
nnoremap <leader>cN' F'ci'

" bufferless delete
nnoremap <leader>x "_x
nnoremap <leader>dw "_dw
nnoremap <leader>dd "_dd
vnoremap <leader>d "_d

" sort
vnoremap <leader>su :sort<space>u<cr>

" Tabularize on :
vnoremap <leader>: :Tabularize/:/<Enter>

" Sort and tabularize on :
vnoremap <leader>s: :sort<space>u<Enter>gv:Tabularize/:/<Enter>

" Semicolon at the end of the current line
nnoremap <leader>a; mpA;<Esc>`p

" semicolon to colon
nnoremap ; :

" unhilight search term
nnoremap <leader>n :noh<CR>

" Save and quit shortcuts
noremap <leader>w :w<cr>
noremap <leader>q :q!<cr>

" Call NERDTree like in Atom
nnoremap <leader>\ :NERDTree<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move to site of last insert
nnoremap <leader>^ `^

" Open ctrl-p
nnoremap <leader>p :CtrlP<cr>

" splits
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>s :split<cr>

" TEXT EXPANSION SHORTCUTS {{{

" PROJECT SPECIFIC SHORTCUTS {{{

" COMPASS {{{

inoremap <leader>cn className={<space>cn()<space>}<Esc>F(a

" }}}

" }}}

" }}}
