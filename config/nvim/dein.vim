set runtimepath+=/Users/aji/.dotfiles/config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/aji/.dotfiles/config/nvim/dein')
  call dein#begin('/Users/aji/.dotfiles/config/nvim/dein')

  " Let dein manage dein
  call dein#add('/Users/aji/.dotfiles/config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " arpeggio key chording
  " call dein#add('kana/vim-arpeggio', {
  "       \'hook_add': "call arpeggio#load()\n
  "       \             let g:arpeggio_timeoutlen=100\n
  "       \             Arpeggio inoremap jk <esc>"
  "       \})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

