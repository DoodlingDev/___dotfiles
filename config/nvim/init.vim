" INIT {{{
runtime! macros/matchit.vim " better % matching

set shell=$SHELL " set shell to system $SHELL
set encoding=utf-8
set fileencoding=utf-8
let mapleader="," " map leader to comma

" VIMRC {{{
" open config in new tab
nnoremap <leader>rc :tabe<space>$MYVIMRC<cr>:vsplit<cr><c-l>:e<space>~/.dotfiles/config/nvim/vundle.vim<cr><c-w>h
" source vimrc
nnoremap <leader>sv :source<space>$MYVIMRC<cr>
" }}}

" VUNDLE {{{
exec "source ~/.dotfiles/config/nvim/vundle.vim"
exec "source ~/.dotfiles/config/nvim/leader_maps.vim"
exec "source ~/.dotfiles/config/nvim/visual_box.vim"
exec "source ~/.dotfiles/config/nvim/new_log.vim"


" }}}
" COLORS {{{
set termguicolors
syntax enable
colorscheme vim-material
highlight Normal guibg=dark
highlight NonText guibg=dark
" makes completion menu visible
highlight Pmenu guibg=lightblue guifg=black
set background=dark
" }}}

" {{{ GLOBALS
set backspace=2
set noswapfile
set history=200
set ruler
set showcmd                 " show command in status line
set autoread
set autowrite
set incsearch
set foldlevelstart=99
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
set formatoptions-=tc
set textwidth=0
set numberwidth=5
set number
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
:set so=10                  " set cursor offset
" }}}
" }}}
" AG/SEARCHER {{{
if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif
" }}}
" AUTOCOMMANDS {{{
autocmd InsertEnter * hi CursorLine guibg=#000000
autocmd InsertEnter * hi CursorColumn guibg=#000000
autocmd InsertLeave * hi CursorLine guibg=DarkSlateGray
autocmd InsertLeave * hi CursorColumn guibg=DarkSlateGray
autocmd BufWritePre * :%s/\s\+$//e    " remove trailing whitespace

autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorcolumn
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorcolumn

autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}

" Filetype {{{
filetype on
augroup vimrcEx
  autocmd!
  filetype plugin indent on
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.{jscs,jshint,eslint} set filetype=json
  autocmd BufRead,BufNewFile *.{jsx,es6,js} set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.spec.js set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.slim set filetype=slim
  autocmd BufRead,BufNewFile *.rb set filetype=ruby
  autocmd BufRead,BufNewFile *.scss set filetype=scss.css
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
augroup END

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END
" }}}
" }}}

" PERSONAL KEYBINDINGS {{{

" Fuzzy file finder respecting .gitignore
nnoremap <leader>e :GFiles<cr>

nnoremap <leader>p :FZF<cr>

" inoremap jk <esc> removed because of arpeggio
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap J 10j
nnoremap K 10k

"stop that stupid window from popping up
map q: :q

" make y work like c & d
nnoremap Y y$

tnoremap <esc> <C-\><C-n>

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



" Common ruby-like regex for search using 'very magic mode'
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v

" add blank line above
nnoremap [<space> mwO<esc>`w
" add blank line below
nnoremap ]<space> mwo<esc>`w

" move selection up
vnoremap <S-k> :move'<--".1<cr>gv
" move selection down
vnoremap <S-j> :move'>+".1<cr>gv

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

" arrow keys navigate buffers
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

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

" exit insert mode and mode one window back (from terminal)
tnoremap ,gt <C-\><C-n>gt

" PROJECT SPECIFIC SHORTCUTS {{{

" }}}

" }}}

set runtimepath+=$HOME/.dotfiles/config/nvim/bundle/denite.nvim
let s:menus = {}

let s:menus.my_commands = {
      \ 'description': 'Example Commands'
      \}

let s:menus.my_commands.command_candidates = [
      \ ['split the window', 'vnew'],
      \ ]

call denite#custom#var('menu', 'menus', s:menus)
