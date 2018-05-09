filetype off
let g:PLUGIN_PATH="~/.dotfiles/config/nvim/bundle" " Path variable for plugins directory

" VUNDLE {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/config/nvim/bundle/Vundle.vim
call vundle#rc("~/.dotfiles/config/nvim/bundle")
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}
" PLUGINS {{{
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'hecal3/vim-leader-guide'

Plugin 'eugen0329/vim-esearch'
Plugin 'janko-m/vim-test'
Plugin 'jeetsukumaran/vim-filebeagle'

" material colorscheme
Plugin 'hzchirs/vim-material'

Plugin 'rhysd/vim-crystal'

" scratch buffer
Plugin 'chrisbra/NrrwRgn'

" Autocomplete brackets
Plugin 'jiangmiao/auto-pairs'

" GraphQL support
Plugin 'jparise/vim-graphql'
"
" interactive command execution
Plugin 'Shougo/vimproc.vim'

" snippet manager
Plugin 'neoclide/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Sizes window splits to the golden ratio
Plugin 'roman/golden-ratio'

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

" slim syntax highlighting
Plugin 'slim-template/vim-slim'

" Javascript highlighting etc
Plugin 'othree/yajs.vim'

" JSX highlighting
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Git plugin and functionality
Plugin 'tpope/vim-fugitive'

" Tern server client for vim
Plugin 'ternjs/tern_for_vim'

" Supercharged statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" indentation & columnar alignment
Plugin 'godlygeek/tabular'

" <TAB> addon
Plugin 'ervandew/supertab'

" easily navigate VIM and TMUX panes
Bundle 'christoomey/vim-tmux-navigator'

" typescript support
Plugin 'leafgarland/typescript-vim'

" flow plugin
Plugin 'flowtype/vim-flow'

" Javascript auto-formatting
Plugin 'prettier/vim-prettier'

" javascript libraries support
Plugin 'othree/javascript-libraries-syntax.vim'

" JSDoc auto-snippets
Plugin 'heavenshell/vim-jsdoc'
let g:jsdoc_return=0 " conflicting with eslint, which wants 'return' over 'returns'

" DevDocs integration
Plugin 'rhysd/devdocs.vim'

" Use fzf for fuzzy finding
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" Better syntax highlighting for JSON
Plugin 'elzr/vim-json'

" Navigate easily around commonjs modules
Plugin 'moll/vim-node'

" Personal Wiki in Vim
Plugin 'vimwiki/vimwiki'

" Quick access to UNIX commands
Plugin 'tpope/vim-eunuch'

" completion framework
Plugin 'roxma/nvim-completion-manager'
Plugin 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plugin 'roxma/ncm-flow'
Plugin 'roxma/ncm-rct-complete'
Plugin 'mhartington/nvim-typescript'
Plugin 'fgrsnau/ncm-otherbuf'
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'

"Plugin 'doodlingdev/vim-mission-control'

Plugin 'universal-ctags/ctags'
" }}}

call vundle#end()
filetype on

" PLUGIN CONFIGS {{{

" arpeggio {{{
call arpeggio#load()
let g:arpeggio_timeoutlen = 100
Arpeggio inoremap jk <esc>
Arpeggio inoremap fj <C-o>:LeaderGuideD g:snip_guide<cr>
" Arpeggio inoremap hl <C-o>:call<space>leaderGuide#start('0',<space>g:snipguide,<space>"Snippets Guide")<cr>
" }}}

" ultisnips {{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" language server {{{
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-langserver'],
      \ 'javascript.jsx': ['javascript-typescript-langserver'],
      \ 'ruby': ['language_server-ruby'],
      \ }
" let g:LanguageClient_diagnosticsList = ''

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
set runtimepath+=~/.dotfiles/config/nvim/bundle/LanguageClient-neovim

" Use LanguageServer for omnifunc completion
autocmd FileType javascript,javascript.jsx setlocal omnifunc=LanguageClient#complete
" }}}

" denite {{{
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command',
      \[ 'ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" }}}

" ale {{{
let g:ale_javascript_eslint_suppress_eslintignore = 1
" let g:ale_completion_enabled=1
let g:ale_linters = {'javascript': ['prettier', 'eslint', 'flow'],
      \ 'javascript.jsx': ['prettier', 'eslint', 'flow'],
      \ 'ruby': ['rubocop']
      \ }

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'javascript.jsx': ['eslint']
      \ }
" }}}

" tern_for_vim {{{
let g:tern#command = ["/usr/local/bin/tern"]
let g:tern#argument = ["--persistent"]
let g:tern_map_keys = 1
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints="on_hold"
nnoremap <leader>td :TernDefPreview<cr>
" }}}

" airline {{{
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
" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" flow {{{
let g:flow#autoclose=1 " Autoclose quickfix window when no errors
let g:flow#enable=1 " Enable Flow on :w
" }}}

" prettier {{{
" Prettier uses double quotes
let g:prettier#config#single_quote="false"
let g:prettier#config#jsx_bracket_same_line="false"
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#trailing_comma = 'all'
" }}}

" Golden Ratio {{{
let g:golden_ratio_exclude_nonmodifiable = 1
" }}}

" NVfzf {{{
" let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'path_html': '~/Dropbox/notes/_public_html/', 'nested_syntax': {'js': 'javascript.jsx', 'ruby': 'ruby'}, 'syntax': 'markdown', 'ext': '.md'}]
" nnoremap <leader>we :FZF<space>~/Dropbox/notes<cr>
" }}}

let g:cm_sources_override = {
      \'cm-ultisnips': {'enable': 0}
      \}

call denite#custom#source('notes', 'matchers', ['matcher/fuzzy'])
call denite#custom#var('notes', 'command', 'ls ~/Dropbox/notes')
let g:notes_directories = ['~/Dropbox/notes']
" }}}

