scriptencoding utf-8
filetype off
let g:PLUGIN_PATH='~/.dotfiles/config/nvim/bundle' " Path variable for plugins directory

" VUNDLE {{{
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.dotfiles/config/nvim/bundle/Vundle.vim
call vundle#rc('~/.dotfiles/config/nvim/bundle')
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}
" PLUGINS {{{
" Productivity {{{
" Bundle 'christoomey/vim-tmux-navigator'
" Plugin 'vimwiki/vimwiki'
Plugin 'hecal3/vim-leader-guide'
" Plugin 'rhysd/devdocs.vim'
" Plugin 'shougo/vimproc.vim'
" Plugin 'shougo/denite.nvim'
" Plugin 'kana/vim-arpeggio'
" Plugin 'benizi/vim-automkdir'
" Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'tmux-plugins/vim-tmux-focus-events'
" }}}
" Language Support {{{
  " clojure
Plugin 'tpope/vim-fireplace'
  " crystal
Plugin 'rhysd/vim-crystal'
  " elixir
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
  " graphql
Plugin 'jparise/vim-graphql'
  " javascript
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'leafgarland/typescript-vim'
Plugin 'shougo/echodoc.vim' " function signatures in command line
  " markdown
Plugin 'tpope/vim-markdown'
  " ruby/rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
  " slim
Plugin 'slim-template/vim-slim'
" }}}
" Code Analysis {{{
Plugin 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins', 'tag': 'binary-*-x86_64-apple-darwin'}
Plugin 'w0rp/ale'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'flowtype/vim-flow'
" }}}
" Text Manipulation {{{
Plugin 'chrisbra/NrrwRgn'
Plugin 'prettier/vim-prettier'
Plugin 'jiangmiao/auto-pairs'
Plugin 'neoclide/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-endwise'
" Bundle 'tomtom/tcomment_vim'
Plugin 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
" }}}
" File System {{{
Plugin 'jeetsukumaran/vim-filebeagle'
" Plugin 'vim-scripts/LustyExplorer'
Plugin 'universal-ctags/ctags'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-eunuch'
" }}}
" Search {{{
Plugin 'eugen0329/vim-esearch'
Plugin 'junegunn/fzf.vim'
Plugin 'easymotion/vim-easymotion'
" }}}
" Test Running {{{
Plugin 'janko-m/vim-test'
" }}}
" Visual {{{
" morhetz/gruvbox
Plugin 'morhetz/gruvbox'
Plugin 'hzchirs/vim-material'
" Plugin 'morhetz/gruvbox'
Plugin 'roman/golden-ratio'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" }}}
" Completion Framework {{{
Plugin 'roxma/nvim-completion-manager'
Plugin 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plugin 'roxma/ncm-flow'
Plugin 'roxma/ncm-rct-complete'
Plugin 'mhartington/nvim-typescript'
Plugin 'fgrsnau/ncm-otherbuf'
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'
Plugin 'thalesmello/webcomplete.vim'
" }}}
" }}}

call vundle#end()
filetype on


" PLUGIN CONFIGS {{{
let g:jsx_ext_required = 0
let g:jsdoc_return=0 " conflicting with eslint, which wants 'return' over 'returns'
set runtimepath+=/usr/local/opt/fzf

" arpeggio {{{
" call arpeggio#load()
" let g:arpeggio_timeoutlen = 100
" Arpeggio inoremap jk <esc>
" Arpeggio inoremap fj <C-o>:LeaderGuideD g:snip_guide<cr>
" Arpeggio inoremap hl <C-o>:call<space>leaderGuide#start('0',<space>g:snipguide,<space>"Snippets Guide")<cr>
" }}}

nnoremap <silent> <space> :LeaderGuideD g:nmap<cr>
nnoremap <space>fgs :GStatus

" ultisnips {{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit='vertical'
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
" autocmd FileType javascript,javascript.jsx setlocal omnifunc=LanguageClient#completaugroup languageServer
" }}}


" ale {{{
let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:ale_sign_column_always=1
" let g:ale_completion_enabled=1
let g:ale_linters = {'javascript': ['prettier', 'eslint', 'flow'],
      \ 'javascript.jsx': ['prettier', 'eslint', 'flow'],
      \ 'ruby': ['rubocop', 'reek', 'rails_best_practices'],
      \ 'clojure': ['joker'],
      \ 'gitcommit': ['gitlint'],
      \ 'json': ['prettier', 'jsonlint'],
      \ 'scss': ['prettier', 'scss-lint'],
      \ 'vim': ['vint']
      \ }

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'javascript.jsx': ['eslint']
      \ }
" }}}

" tern_for_vim {{{
let g:tern#command = ['/usr/local/bin/tern']
let g:tern#argument = ['--persistent']
let g:tern_map_keys = 1
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints='on_hold'
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
let g:airline#extensions#branch#vcs_priority = ['git', 'mercurial']
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" airline tab w/ tab number
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" }}}

" supertab {{{
let g:SuperTabDefaultCompletionType = '<c-n>'
" }}}

" flow {{{
let g:flow#autoclose=1 " Autoclose quickfix window when no errors
let g:flow#enable=1 " Enable Flow on :w
" }}}

" prettier {{{
" Prettier uses double quotes
let g:prettier#config#single_quote='false'
let g:prettier#config#jsx_bracket_same_line='false'
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#trailing_comma = 'all'
" }}}

" Golden Ratio {{{
let g:golden_ratio_exclude_nonmodifiable = 1
" }}}

" NVfzf {{{
let g:vimwiki_list = [{'path': '~/Dropbox/notes/', 'path_html': '~/Dropbox/notes/_public_html/', 'nested_syntax': {'js': 'javascript.jsx', 'ruby': 'ruby'}, 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path': ''}]
" nnoremap <leader>we :FZF<space>~/Dropbox/notes<cr>
" nnoremap <leader>we :Denite<space>file_rec<space>-path=~/Dropbox/notes<cr>
" nnoremap <leader>wg :Denite<space>grep<space>-path=~/Dropbox/notes<cr>
" }}}

let g:cm_sources_override = {
      \'cm-ultisnips': {'enable': 0}
      \}

" }}}

filetype on
