" INIT {{{

runtime! macros/matchit.vim

set nocompatible " use vim, not vi api
set shell=$SHELL
set encoding=utf-8
set fileencoding=utf-8
let mapleader=","
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

" fuzzy search
Bundle 'ctrlpvim/ctrlp.vim'

" Snippets
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Language Server Protocal
Plugin 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Show function signatures and inline docs
Plugin 'shougo/echodoc.vim'

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

" highlight changes in vim
Plugin 'airblade/vim-gitgutter'

" slim syhtax highlighting
Plugin 'slim-template/vim-slim'

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

" Tern for Vim
Plugin 'ternjs/tern_for_vim'

" Airline statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'godlygeek/csapprox'

" vertical alignment
Plugin 'godlygeek/tabular'

" supertab <TAB> addon
Plugin 'ervandew/supertab'

" easily navigate VIM and TMUX panes
Bundle 'christoomey/vim-tmux-navigator'

" typescript support
Plugin 'leafgarland/typescript-vim'

" flow plugin
Plugin 'flowtype/vim-flow'

" prettier
Plugin 'prettier/vim-prettier'

" javascript libraries support
Plugin 'othree/javascript-libraries-syntax.vim'

" JSDoc auto-snippets
Plugin 'heavenshell/vim-jsdoc'

" turtles colorscheme
Bundle 'beigebrucewayne/turtles'

" ctrl-p extension - command palette
Bundle 'fisadev/vim-ctrlp-cmdpalette'

" DevDocs
Plugin 'rhysd/devdocs.vim'

" keybinding-guide
Plugin 'DoodlingDev/vim-mission-control'

call vundle#end()

" }}}

set termguicolors
syntax enable
colorscheme jellybeans

" TERMINAL {{{

tnoremap jk <C-\><C-n>

let g:terminal_color_0 = '#003541'
let g:terminal_color_1 = '#dc322f'
let g:terminal_color_2 = '#859901'
let g:terminal_color_3 = '#b58901'
let g:terminal_color_4 = '#2C8DD6'
let g:terminal_color_5 = '#d33682'
let g:terminal_color_6 = '#2aa198'
let g:terminal_color_7 = '#eee8d5'
let g:terminal_color_8 = '#002833'
let g:terminal_color_9 = '#cb4b16'
let g:terminal_color_10 = '#586e75'
let g:terminal_color_11 = '#657b83'
let g:terminal_color_12 = '#839496'
let g:terminal_color_13 = '#6c6ec6'
let g:terminal_color_14 = '#93a1a1'
let g:terminal_color_15 = '#fdf6e3'

" }}}

highlight Normal guibg=none
highlight NonText guibg=none

" {{{ GLOBALS

set backspace=2
set noswapfile
set history=200
set ruler
set showcmd                 " show command in status line
set autoread
set autowrite
set incsearch
set foldmethod=marker
set cursorline
set nohlsearch
set lazyredraw              " Don't redraw during macros
set nojoinspaces            " Use one space, not two, after punctuation.
set hidden                  " Hides buffers instead of closing them

set tabstop=2               " tab = 2spaces
set smarttab                " soft tabs
set shiftwidth=2            " Number of spaces to use in autoindenting
set shiftround
set expandtab
set wrap                    " set linebreak
set linebreak               " Only break line at non-word character
set nolist                  " Only linebreak when I press enter
set smartindent             " Smart autoindenting on new lines
set formatoptions-=tc

                            " Make it obvious where 80 chars is
set textwidth=0
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
set smartcase

set previewheight=8         " Completion preview height

set clipboard=unnamed

" set cursor offset
:set so=10

" }}}

" }}}

" DEOPLETE {{{

call deoplete#enable()
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

" let g:ale_completion_enabled=1
let g:ale_linters = {'javascript': ['prettier', 'eslint'],
                    \ 'javascript.jsx': ['prettier', 'eslint'],
                    \ 'ruby': ['rubocop']
                    \ }

let g:ale_fixers = {
\   'javascript': ['eslint']
\ }

" }}}

" PLUGIN CONFIGS {{{

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "X"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit="vertical"

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:ale_javascript_eslint_suppress_eslintignore = 1
" Prettier uses double quotes
let g:prettier#config#single_quote="false"
let g:prettier#config#jsx_bracket_same_line="false"
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#trailing_comma = 'all'

" Path variable for plugins directory
let g:PLUGIN_PATH="~/.dotfiles/config/nvim/bundle"

" JSDoc
let g:jsdoc_return=0 " conflicting with eslint, which wants 'return' over 'returns'

" Flow config
" Autoclose quickfix window when no errors
let g:flow#autoclose=1

" Enable Flow on :w
let g:flow#enable=1

if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif

" tern_for_vim & deoplete
let g:deoplete#enable_at_startup=1

let g:tern#command = ["tern"]
let g:tern#argument = ["--persistent"]
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints="on_hold"

let g:airline_powerline_fonts=1

" LanguageClient
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsList = ''

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
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" {{{ PERSONAL COMMANDS


" }}}

" PERSONAL KEYBINDINGS {{{

inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap J 10j
nnoremap K 10k

"stop that stupid window from popping up
map q: :q

" Jump to the end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

inoremap JK <Esc>/-+-<Enter>:noh<Enter>"_3cl

" indent selection and stay selected
vnoremap > >gv
vnoremap < <gv
vnoremap <space> I<space><esc>gv

" add blank line above
nnoremap [<space> mwO<esc>`w
" add blank line below
nnoremap ]<space> mwo<esc>`w

" move selection up
vnoremap <S-k> :move'<--".1<cr>gv
" move selection down
vnoremap <S-j> :move'>+".1<cr>gv

" vim remap <space>
inoremap <C-space>. <lt>space>

" snippet ++++ remover
inoremap <C-space>++ <lt>esc>?++++<lt>cr>:noh<lt>cr>c4l

" change next inside ({["''"]})
nnoremap cn( f(ci(
nnoremap cN( F(ci(
nnoremap cn) f)ci)
nnoremap cN) F)ci)
nnoremap cn{ f{ci{
nnoremap cN{ F{ci{
nnoremap cn} f}ci}
nnoremap cN} F}ci}
nnoremap cn[ f[ci[
nnoremap cN[ F[ci[
nnoremap cn] f]ci]
nnoremap cN] F]ci]
nnoremap cn" f"ci"
nnoremap cN" F"ci"
nnoremap cn' f'ci'
nnoremap cN' F'ci'

" move line from normal mode
nnoremap > v><esc>
nnoremap < v<<esc>

" Semicolon at the end of the current line
nnoremap <leader>a; mpA;<Esc>`p

" semicolon to colon
nnoremap ; :

" easy exit visual mode
vnoremap a <esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" TEXT EXPANSION SHORTCUTS {{{

inoremap {<cr> {<cr>}<esc>O

" PROJECT SPECIFIC SHORTCUTS {{{

" COMPASS {{{

inoremap <leader>cn className={<space>cn()<space>}<Esc>F(a

" }}}

" }}}

" }}}
" }}}

