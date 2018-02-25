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
" Vim-Pug {{{

  " pug templating syntax highlighting
  Plugin 'digitaltoad/vim-pug'

  " }}}
" Vim-Pug-Complete {{{

  " pug template autocompletion
  Plugin 'dNitro/vim-pug-complete'

  " }}}
" Vim-Material {{{

  " material colorscheme
  Plugin 'hzchirs/vim-material'

  " }}}
" Solarized {{{
" Solarized colorscheme
  Plugin 'frankier/vim-colors-solarized'
  " }}}
" Vim-Indent-Object {{{

  " indentation level as text object
  Plugin 'michaeljsmith/vim-indent-object'

  " }}}
" NrrwRgn {{{

  " Separate a selection of text into a small
  " scratch buffer
  Plugin 'chrisbra/NrrwRgn'

  " }}}
" NerdTree {{{

  " file management
  Bundle 'scrooloose/nerdtree'

  " }}}
" Auto-Pairs {{{

  " Autocomplete brackets
  Plugin 'jiangmiao/auto-pairs'

  " }}}
" Vim-Graphql {{{

  " GraphQL support
  Plugin 'jparise/vim-graphql'

  " }}}
" Vimproc {{{

  " interactive command execution
  Plugin 'Shougo/vimproc.vim'

  " }}}
" UltiSnips {{{

  " snippet manager
  Plugin 'neoclide/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plugin 'honza/vim-snippets'

  " }}}
" Golden Ratio {{{

  " Sizes window splits to the golden ratio
  Plugin 'roman/golden-ratio'

  " }}}
" JSPC {{{

  " Function parameter completion
  Plugin 'othree/jspc.vim'

  " }}}
" LanguageClient-neovim {{{

  " Language Server Protocal
  Plugin 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins', 'tag': 'binary-*-x86_64-apple-darwin'}

  " }}}
" EchoDoc {{{

  " Show function signatures and inline docs
  Plugin 'shougo/echodoc.vim'

  " }}}
" Denite {{{

  " neovim's unite
  Plugin 'shougo/denite.nvim'

  " }}}
" Ale {{{

  " Asynchronous Linting
  Plugin 'w0rp/ale'

  " }}}
" Tpope's Vim-Rails {{{

  " Rails
  Plugin 'tpope/vim-rails'

  " }}}
" Tpope's Vim-endwise {{{

  " auto places ends in ruby
  Plugin 'tpope/vim-endwise'

  " }}}
" Vim-Ruby-Refactoring {{{

  " ruby refactoring tools
  Plugin 'ecomba/vim-ruby-refactoring'

  " }}}
" Arpeggio {{{

  " Key chording
  Plugin 'kana/vim-arpeggio'

  " }}}
" Vim-Ruby {{{

  " Ruby
  Plugin 'vim-ruby/vim-ruby'

  " }}}
" Vim-Easymotion {{{

  " Easymotion
  Plugin 'easymotion/vim-easymotion'

  " }}}
" TComment_vim {{{

  " comment and uncomment
  Bundle 'tomtom/tcomment_vim'

  " }}}
" Vim-Surround {{{

  " surround block with quetes etc
  Bundle 'tpope/vim-surround'

  " }}}
" Tpope's Vim-Markdown {{{

  " work more easily with markdown files
  Plugin 'tpope/vim-markdown'

  " }}}
" Vim-Slim {{{

  " slim syntax highlighting
  Plugin 'slim-template/vim-slim'

  " }}}
" YAJS {{{

  " Javascript highlighting etc
  Plugin 'othree/yajs.vim'

  " }}}
" Vim-Jsx {{{

  " JSX highlighting
  Plugin 'mxw/vim-jsx'
  let g:jsx_ext_required = 0

  " }}}
" Tpope's Fugitive {{{

  " Git plugin and functionality
  Plugin 'tpope/vim-fugitive'

  " }}}
" Deoplete {{{

  " Async completion
  Plugin 'Shougo/deoplete.nvim'

  " }}}
" Deoplete-ternJS {{{

  " Tern and deoplete
  Plugin 'carlitux/deoplete-ternjs'

  " }}}
" Tern for Vim {{{

  " Tern server client for vim
  Plugin 'ternjs/tern_for_vim'

  " }}}
" Airline {{{

  " Supercharged statusline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " }}}
" Tabular {{{

  " indentation & columnar alignment
  Plugin 'godlygeek/tabular'

  " }}}
" Supertab {{{

  " <TAB> addon
  Plugin 'ervandew/supertab'

  " }}}
" Vim-Tmux-Navigator {{{

  " easily navigate VIM and TMUX panes
  Bundle 'christoomey/vim-tmux-navigator'

  " }}}
" Typescript-vim {{{

  " typescript support
  Plugin 'leafgarland/typescript-vim'

  " }}}
" Vim-Flow {{{

  " flow plugin
  Plugin 'flowtype/vim-flow'

  " }}}
" Prettier {{{

  " Javascript auto-formatting
  Plugin 'prettier/vim-prettier'

  " }}}
" Javascript-libraries-syntax.vim {{{

  " javascript libraries support
  Plugin 'othree/javascript-libraries-syntax.vim'

  " }}}
" Vim-JsDoc {{{

  " JSDoc auto-snippets
  Plugin 'heavenshell/vim-jsdoc'
  let g:jsdoc_return=0 " conflicting with eslint, which wants 'return' over 'returns'

  " }}}
" DevDocs {{{

  " DevDocs integration
  Plugin 'rhysd/devdocs.vim'

  " }}}
" FZF {{{

  " Use fzf for fuzzy finding
  set rtp+=/usr/local/opt/fzf
  Plugin 'junegunn/fzf.vim'

  " }}}
" Vim Mission Control {{{

  " keybinding-guide
  Plugin 'DoodlingDev/vim-mission-control'

  " }}}
" Neo Term {{{
" Open multiple terminals at once

  " Quick open terminals
  Plugin 'kassio/neoterm'

  " }}}
" Vim L9 {{{
" Required for AutoComplPop

  Plugin 'eparreno/vim-l9'

  " }}}
" Vim-AutoComplPop {{{
" Required for AutoComplPop
  " Plugin 'othree/vim-autocomplpop'
  " }}}
" vim-json {{{
  " Better syntax highlighting for JSON
  Plugin 'elzr/vim-json'
  " }}}
" vim-node {{{
  " Navigate easily around commonjs modules
  Plugin 'moll/vim-node'
  " }}}
" vim-wiki {{{
" Personal Wiki in Vim
Plugin 'vimwiki/vimwiki'
" }}}
" }}}

call vundle#end()
filetype on

" PLUGIN CONFIGS {{{
" arpeggio {{{
call arpeggio#load()
let g:arpeggio_timeoutlen = 100
Arpeggio inoremap jk <esc>
Arpeggio inoremap hl <C-o>:call<space>leaderGuide#start('0',<space>g:snipguide,<space>"Snippets Guide")<cr>
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
let g:LanguageClient_diagnosticsList = ''
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
set runtimepath+=~/.dotfiles/config/nvim/bundle/LanguageClient-neovim

" Use LanguageServer for omnifunc completion
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" }}}
" denite {{{
" Change file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" }}}
" ale {{{
let g:ale_javascript_eslint_suppress_eslintignore = 1
" let g:ale_completion_enabled=1
let g:ale_linters = {'javascript': ['prettier', 'eslint', 'flow'],
                    \ 'javascript.jsx': ['prettier', 'eslint'],
                    \ 'ruby': ['rubocop']
                    \ }

let g:ale_fixers = {
\   'javascript': ['eslint']
\ }
" }}}
" deoplete {{{
call deoplete#enable()
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" }}}
" tern_for_vim & deoplete {{{
let g:deoplete#sources#ternjs#docs=0
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#ternjs#tern_bin="/usr/local/bin/tern"
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni',
  \ 'LanguageClient#complete',
\]
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
" let g:golden_ratio_exclude_nonmodifiable = 1
" }}}
" NeoTerm {{{
nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,tc :call neoterm#clear()<cr>
nnoremap <silent> ,tk :call neoterm#kill()<cr>
" }}}
" NVfzf {{{
let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'path_html': '~/Dropbox/notes/_public_html/', 'nested_syntaxes': {'js': 'javascript', 'ruby': 'ruby'}, 'syntax': 'markdown', 'ext': '.md'}]
nnoremap <leader>we :FZF<space>~/Dropbox/notes<cr>
" }}}
" }}}
