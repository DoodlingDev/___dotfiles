filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/config/nvim/bundle/Vundle.vim
call vundle#rc("~/.dotfiles/config/nvim/bundle")
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" pug templating syntax highlighting
Plugin 'digitaltoad/vim-pug'
" pug template autocompletion
Plugin 'dNitro/vim-pug-complete'

" Plugin 'tyrannicaltoucan/vim-quantum'
" Plugin 'skielbasa/vim-material-monokai'
Plugin 'hzchirs/vim-material'

" indentation level as text object
Plugin 'michaeljsmith/vim-indent-object'

Plugin 'chrisbra/NrrwRgn'

" file management
Bundle 'scrooloose/nerdtree'

" Autocomplete brackets
Plugin 'jiangmiao/auto-pairs'

" GraphQL support
Plugin 'jparise/vim-graphql'

" interactive command execution
Plugin 'Shougo/vimproc.vim'

" Snippets
Plugin 'neoclide/ultisnips'

Plugin 'roman/golden-ratio'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Function parameter completion
Plugin 'othree/jspc.vim'

" Language Server Protocal
Plugin 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins', 'tag': 'binary-*-x86_64-apple-darwin'}

" Show function signatures and inline docs
Plugin 'shougo/echodoc.vim'

" neovim's unite
Plugin 'shougo/denite.nvim'

" Asynchronous Linting
Plugin 'w0rp/ale'

" Rails
Plugin 'tpope/vim-rails'

" auto places ends in ruby
Plugin 'tpope/vim-endwise'

" ruby refactoring tools
Plugin 'ecomba/vim-ruby-refactoring'

" Key chording
Plugin 'kana/vim-arpeggio'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Easymotion
Plugin 'easymotion/vim-easymotion'

" comment and uncomment
Bundle 'tomtom/tcomment_vim'

" surround block with quetes etc
Bundle 'tpope/vim-surround'

" work more easily with markdown files
Plugin 'tpope/vim-markdown'

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

" DevDocs
Plugin 'rhysd/devdocs.vim'

" Use fzf for fuzzy finding
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" keybinding-guide
Plugin 'DoodlingDev/vim-mission-control'

call vundle#end()

