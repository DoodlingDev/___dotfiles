" INIT {{{

runtime! macros/matchit.vim

set nocompatible " use vim, not vi api
set shell=$SHELL
set encoding=utf-8
set fileencoding=utf-8
let mapleader=","
" open config in new tab
nnoremap <leader>rc :tabe<space>$MYVIMRC<cr>:vsplit<cr><c-l>:e<space>~/.dotfiles/config/nvim/vundle.vim<cr><c-w>h
" source vimrc
nnoremap <leader>sv :source<space>$MYVIMRC<cr>

" VUNDLE
exec "source ~/.config/nvim/vundle.vim"

set termguicolors
syntax enable
colorscheme vim-material

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

highlight Normal guibg=dark
highlight NonText guibg=dark
highlight Pmenu guibg=lightblue guifg=black

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
" set relativenumber        " turned off because of <leader>j/k easymotion

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
let g:ale_linters = {'javascript': ['prettier', 'eslint', 'flow'],
                    \ 'javascript.jsx': ['prettier', 'eslint'],
                    \ 'ruby': ['rubocop']
                    \ }

let g:ale_fixers = {
\   'javascript': ['eslint']
\ }

" }}}

" PLUGIN CONFIGS {{{

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-e>"
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

" Change file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

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

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif

" tern_for_vim & deoplete
let g:deoplete#sources#ternjs#docs=1
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#ternjs#tern_bin="/Users/aji/.nvm/versions/node/v9.5.0/bin/tern"
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:tern#command = ["/Users/aji/.nvm/versions/node/v9.5.0/bin/tern"]
let g:tern#argument = ["--persistent"]
let g:tern_map_keys = 1
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints="on_hold"
nnoremap <leader>td :TernDefPreview<cr>

let g:airline_powerline_fonts=1

" LanguageClient
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-langserver'],
  \ 'javascript.jsx': ['javascript-typescript-langserver'],
  \ 'ruby': ['language_server-ruby'],
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

nnoremap <leader>e :GFiles<cr>

" arpeggio key chords
call arpeggio#load()
let g:arpeggio_timeoutlen = 200
Arpeggio inoremap jk <esc>
Arpeggio inoremap s<space> <C-o>:call<space>leaderGuide#start('0',<space>g:snipguide,<space>"Snippets Guide")<cr>

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/my_wiki', 'path_html': '~/Dropbox/my_wiki/html/', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': {'ruby': 'ruby', 'python': 'python', 'javascript': 'javascript', 'vimscript': 'vimscript', 'html': 'html', 'css': 'css', 'bash': 'sh'}}]
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=2

" }}}

" AUTOCOMMANDS {{{

" turn on line highlight in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" {{{ PERSONAL COMMANDS

if !exists("*FocusModeToggle")
  function FocusModeToggle()
    if !exists("w:focusMode")
      let w:focusMode = 0
    endif

    if w:focusMode ==? 0
      call feedkeys("\<C-w>_\<C-w>|")
      let w:focusMode = 1
    else
      call feedkeys("\<C-w>=")
      let w:focusMode = 0
    endif
  endfunction
endif

nnoremap <leader>f :call<space>FocusModeToggle()<cr>
nnoremap <leader>p :FZF<cr>

" }}}

" PERSONAL KEYBINDINGS {{{


" inoremap jk <esc> removed because of arpeggio
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap J 10j
nnoremap K 10k

"stop that stupid window from popping up
map q: :q

" Fugitive shortcuts
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<space>-v<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>

" quick writes, quick quits
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>

" Jump to the end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" indent selection and stay selected
vnoremap > >gv
vnoremap < <gv
vnoremap <space> I<space><esc>gv

" Open NERDTree like file browser in Atom
nnoremap <leader>\ :NERDTree<cr>

" Easy open CtrlP
"nnoremap <leader>p :CtrlP<cr>

" add blank line above
nnoremap [<space> mwO<esc>`w
" add blank line below
nnoremap ]<space> mwo<esc>`w

" move selection up
vnoremap <S-k> :move'<--".1<cr>gv
" move selection down
vnoremap <S-j> :move'>+".1<cr>gv

" vim remap <space>
" inoremap <C-space>. <lt>space>

" snippet ++++ remover
" inoremap <C-space>++ <lt>esc>?++++<lt>cr>:noh<lt>cr>c4l

" easy navigate tabs
nnoremap gh gT
nnoremap gl gt

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

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>

" semicolon to colon
nnoremap ; :

" easy exit visual mode
vnoremap a <esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" easymotion pair of chars search
nmap s <Plug>(easymotion-s2)

" launch Denite for UltiSnips
nnoremap <leader>u :Denite<space>ultisnips<cr>

" Separate into a scratch buffer with Pug syntax highlighting
vnoremap <leader>p :NR<cr>:set<space>syntax=Pug<cr>:set<space>filetype=Pug<cr>:res<space>+5<cr>


" TEXT EXPANSION SHORTCUTS {{{

" inoremap {<cr> {<cr>}<esc>O

" PROJECT SPECIFIC SHORTCUTS {{{

" }}}

" }}}
" }}}
