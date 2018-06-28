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

" make escape work like escape in terminals
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

" Easily move to start/end of line
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" Copies what was just pasted
xnoremap p pgvy

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
