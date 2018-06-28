set runtimepath+=/Users/aji/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/aji/.config/nvim/dein')
  call dein#begin('/Users/aji/.config/nvim/dein')

  " Let dein manage dein
  call dein#add('/Users/aji/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " PRODUCTIVITY {{{
  " tmux navigation
  call dein#add('christoomey/vim-tmux-navigator')

  " automatically make dirs for new files
  call dein#add('benizi/vim-automkdir')

  " vim-meister's git
  call dein#add('tpope/vim-fugitive')

  " vim wiki
  call dein#add('vimwiki/vimwiki')

  " denite
  call dein#add('Shougo/denite.nvim', {
        \'hook_add': "set runtimepath+=$HOME/.dotfiles/config/nvim/bundle/denite.nvim\n
        \             call denite#custom#var('grep', 'command', ['rg'])\n
        \             call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])\n
        \             call denite#custom#var('grep', 'recursive_opts', [])\n
        \             call denite#custom#var('grep', 'pattern_opt', ['--regexp'])\n
        \             call denite#custom#var('grep', 'separator', ['--'])\n
        \             call denite#custom#var('grep', 'final_opts', [])\n
        \             call denite#custom#var('file_rec', 'command', [ 'ag', '--follow', '--nocolor', '--nogroup', '-g', ''])"
        \})

  " asynchronous execution library
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " devdocs
  call dein#add('rhysd/devdocs.vim', {
        \'on_command': ["DevDocs", "DevDocsAll"]
        \})

  " arpeggio key chording
  call dein#add('kana/vim-arpeggio', {
        \'hook_add': "call arpeggio#load()\n
        \             let g:arpeggio_timeoutlen=100\n
        \             Arpeggioinoremap jk <esc>\n
        \             Arpeggioinoremap fj <C-o>:LeaderGuideD g:snip_guide<cr>"
        \})

  call dein#add('autozimu/LanguageClient-neovim', {
      \ 'rev': 'next',
      \ 'build': 'bash install.sh',
      \ })

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

