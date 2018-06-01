" INIT {{{
runtime! macros/matchit.vim " better % matching

set shell=$SHELL " set shell to system $SHELL
set encoding=utf-8
set fileencoding=utf-8
let g:mapleader=',' " map leader to comma

" VIMRC {{{
" open config in new tab
nnoremap <leader>rc :tabe<space>$MYVIMRC<cr>:vsplit<cr><c-l>:e<space>~/.dotfiles/config/nvim/vundle.vim<cr><c-w>h
" source vimrc
nnoremap <leader>sv :source<space>$MYVIMRC<cr>
" }}}

exec 'source ~/.dotfiles/config/nvim/vundle.vim'
exec 'source ~/.dotfiles/config/nvim/dein.vim'

exec 'source ~/.dotfiles/config/nvim/rc/autocmd.vim'
exec 'source ~/.dotfiles/config/nvim/rc/globals.vim'

exec 'source ~/.dotfiles/config/nvim/rc/keybinding.vim'
exec 'source ~/.dotfiles/config/nvim/rc/scripts.vim'

" }}}
"
" AG/SEARCHER {{{
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(':Ag')
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif
" }}}


highlight Comment gui=italic


" explore
" https://github.com/svermeulen/vim-easyclip
