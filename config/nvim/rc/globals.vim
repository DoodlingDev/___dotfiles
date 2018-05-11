set backspace=2
set noswapfile
set history=200
set ruler
set showcmd                 " show command in status line
set autoread
set autowrite
set incsearch
set foldlevelstart=2
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
set scrolloff=10                  " set cursor offset

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
