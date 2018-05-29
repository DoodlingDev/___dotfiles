" nnoremap <space> :LeaderGuideD g:nmap<cr>

let g:leaderGuide_run_map_on_popup=0
" mission control {{{
let g:nmap = {'name': 'Mission Control',
      \'/': ['call feedkeys("gcc")', 'toggle comment (line)'],
      \'h': ['call CmdMenu_feedkeys_input("help for: ", "h ")', 'help ...'],
      \'q': ['q', 'Close Current Buffer'],
      \'Q': ['q', 'Close Current Buffer w/o save'],
      \'r': ['call feedkeys("\<C-r>", "n")', 'redo'],
      \'u': ['u', 'undo'],
      \'=': ['call feedkeys("==", "n")', 'format line'],
      \'+': ['call Feedkeys_input("motion", "=", "")', 'format w/ motion'],
      \'[': ['call feedkeys("mwO\<esc>`w", "n")', 'blank line above'],
      \']': ['call feedkeys("mwo\<esc>`w", "n")', 'blank line below'],
      \}
" nnoremap <space>b BUFFER
" nnoremap <space>c CURSOR
" nnoremap <space>e EDITOR
" nnoremap <space>f FILE
" nnoremap <space>g GIT
nnoremap <space>h :call CmdMenu_feedkeys_input("help for: ", "h ")<cr>
" nnoremap <space>i INSERT
" nnoremap <space>m MOVEMENT
nnoremap <space>q :q<cr>
nnoremap <space>Q :q!<cr>
nnoremap <space>r <C-r>
" nnoremap <space>s SEARCH
" nnoremap <space>t FILETYPE
nnoremap <space>u u
" nnoremap <space>w WORKSPACE
nnoremap <space>= ==
nnoremap <space>+ :call Feedkeys_input("motion", "=", "")<cr>
nnoremap <space>[ mwO\<esc>`w
nnoremap <space>] mwo\<esc>`w
nnoremap <space>['/'] gcc
" }}}
" └> BUFFER {{{
let g:nmap.b = {
      \'name': '+Buffer',
      \'a': ['ball', 'open one window for each buffer'],
      \'A': ['sball', 'open one split for each buffer'],
      \'c': ['checkt', 'reload buffers from disk'],
      \'d': ['Denite buffer -default-action=delete -force-quit', 'list buf and delete'],
      \'g': ['call feedkeys("gg", "n")', 'Scroll to top'],
      \'G': ['call feedkeys("G", "n")', 'Scroll to bottom'],
      \'l': ['Denite buffer', 'list buffers'],
      \'o': ['call CmdMenu_feedkeys_input("file: ", "badd", "")', 'file in buffer w/o opening'],
      \'s': ['split scratch', 'open scratch buffer in split'],
      \'S': ['tabe scratch', 'open scratch buffer in tab'],
      \'u': ['bdelete', 'delete current buffer'],
      \'U': ['bdelete!', 'delete current buffer w/o write'],
      \'v': ['Denite buffer -default-action=vsplit', 'list buffers and open w/split'],
      \'w': ['w', 'write current buffer'],
      \}
nnoremap <space>ba :ball<cr>
nnoremap <space>bA :sball<cr>
nnoremap <space>bc :checkt<cr>
nnoremap <space>bd :Denite buffer -default-action=delete -force-quit<cr>
nnoremap <space>bg gg
nnoremap <space>bG G
nnoremap <space>bl :Denite buffer<cr>
nnoremap <space>bo :call CmdMenu_feedkeys_input("file: ", "badd", "")<cr>
nnoremap <space>bs :split scratch<cr>
nnoremap <space>bS :tabe scratch<cr>
nnoremap <space>bu :bdelete<cr>
nnoremap <space>bU :bdelete!<cr>
nnoremap <space>bv :Denite buffer -default-action=vsplit<cr>
nnoremap <space>bw w
" }}}
" └> CURSOR {{{
let g:nmap.c = {
      \'name': 'Cursor',
      \'b': ['call feedkeys("zb", "n")', 'Scroll to cursor at bottom'],
      \'c': ['call feedkeys("z.", "n")', 'Center on cursor'],
      \'g': ['call feedkeys("gg", "n")', 'Scroll to top'],
      \'G': ['call feedkeys("G", "n")', 'Scroll to bottom'],
      \'i': ['call feedkeys("`.", "n")', 'Goto position of last edit'],
      \'l': ['call Feedkeys_input("line no: ", "", "G")', 'Goto line #...'],
      \'p': ['call feedkeys("`\", "n")', 'Goto last cursor position'],
      \'t': ['call feedkeys("zt", "n")', 'Scroll to cursor at top'],
      \'^': ['call feedkeys("`^", "n")', 'Goto position of last insert'],
      \}
nnoremap <space>cb zb
nnoremap <space>cc z.
nnoremap <space>cg gg
nnoremap <space>cG G
nnoremap <space>ci `.
nnoremap <space>cl :call Feedkeys_input("line no: ", "", "G")<cr>
nnoremap <space>cp `\
nnoremap <space>ct zt
nnoremap <space>c^ `^
" }}}
" └> EDITOR {{{
let g:nmap.v = {
      \'name': 'Editor',
      \'r': ['call feedkeys(":tabe\<space>$MYVIMRC\<cr>:vsplit\<cr>\<c-l>:e\<space>~/.dotfiles/config/nvim/vundle.vim\<cr>\<c-w>h")', 'Open vimrc'],
      \}
nnoremap <space>vr :tabe\<space>$MYVIMRC\<cr>:vsplit\<cr>\<c-l>:e\<space>~/.dotfiles/config/nvim/vundle.vim\<cr>\<c-w>h
" }}}
" └> FILE {{{
let g:nmap.f = {
      \'name': 'File',
      \'*': ['call feedkeys("gf")', 'Goto file under cursor'],
      \'b': ['e "%:p:h"', 'Open cwd'],
      \'c': ['checkt', 'Reload Buffers from disk'],
      \'d': ['call Feedkeys_input("new path: ", ":w", "%:r\<lt>cr>")', 'Save in new directory'],
      \'e': ['Denite file_rec', 'Search files'],
      \'G': ['call feedkeys("\<C-G>", "n")', 'Where am I?'],
      \'i': ['call Feedkeys_input("file: ", ":r ", "\<lt>cr>")', 'Insert file at cursor ...'],
      \'k': ['call Feedkeys_input("dir name: ", ":Mkdir ", "\<lt>cr>")', 'Make dir'],
      \'m': ['call Feedkeys_input("new location: ", ":Move ", "\<lt>cr>")', 'Move file on disk'],
      \'q': ['q', 'Close current buffer'],
      \'Q': ['q!', 'Close buffer w/o write'],
      \'r': ['call Feedkeys_input("new name: ", ":Rename ", "\<lt>cr>")', 'Rename in place'],
      \'v': ['call feedkeys(":tabe\<space>$MYVIMRC\<cr>:vsplit\<cr>\<c-l>:e\<space>~/.dotfiles/config/nvim/vundle.vim\<cr>\<c-w>h")', 'Open vimrc'],
      \'w': ['w', 'Write current buffer'],
      \'W': ['wq', 'Write and quit current'],
      \'x': ['Delete', 'Delete buffer and file'],
      \}
nnoremap <space>f* gf
nnoremap <space>fb :e "%:p:h"<cr>
nnoremap <space>fc :checkt<cr>
nnoremap <space>fd :call Feedkeys_input("new path: ", ":w", "%:r")<cr>
nnoremap <space>fe :Denite file_rec<cr>
nnoremap <space>fg <C-G>
nnoremap <space>fi :call Feedkeys_input("file: ", ':r ', "\<lt>cr>")<cr>
nnoremap <space>fk :call Feedkeys_input("dir name: ", ':Mkdir ', "\<lt>cr>")<cr>
nnoremap <space>fm :call Feedkeys_input("new location: ", ':Move ', "\<lt>cr>")<cr>
nnoremap <space>fq :q<cr>
nnoremap <space>fQ :q!<cr>
nnoremap <space>fr :call Feedkeys_input("new name: ", ':Rename ', "\<lt>cr>")<cr>
nnoremap <space>fv :tabe $MYVIMRC<cr>:vsplit<cr><c-w>l:e ~/.dotfiles/config/nvim/dein.vim<cr><c-w>h
nnoremap <space>fw :w<cr>
nnoremap <space>fW :wq<cr>
nnoremap <space>fx :Delete<cr>
" }}}
" └> GIT (fugitive) {{{
let g:nmap.f.g = {
      \'name': 'Git Commands',
      \'b': ['Gblame', 'Blame'],
      \'c': ['Gcommit -v', 'Commit'],
      \'d': ['Gdiff', 'Diff'],
      \'g': ['Glog', 'Log for current file'],
      \'s': ['Gstatus', 'Status'],
      \'m': ['Gmerge', 'Merge'],
      \'l': ['Gpull origin', 'Pull'],
      \'p': ['Gpush origin', 'Push'],
      \'w': ['Gwrite', 'Write file and add'],
      \'x': ['Feedkeys_needs_confirm("Are you sure you wish to delete this file? y/n?", ":Gdelete\<cr>")',
      \'Delete file & unwatch'],
      \}
nnoremap <space>fgb :Gblame<cr>
nnoremap <space>fgc :Gcommit -v<cr>
nnoremap <space>fgd :Gdiff<cr>
nnoremap <space>fgg :Glog<cr>
nnoremap <space>fgs :Gstatus<cr>
nnoremap <space>fgm :Gmerge<cr>
nnoremap <space>fgl :Gpull origin<cr>
nnoremap <space>fgp :Gpush origin<cr>
nnoremap <space>fgw :Gwrite<cr>
nnoremap <space>fgx :call Feedkeys_needs_confirm("Are you sure you wish to delete this file? y/n?", ":Gdelete\<cr>")<cr>
" }}}
" └> INSERT {{{
let g:nmap.i = {
      \'name': 'Insert',
      \'=': ['call feedkeys("G=gg")', 'Indent buffer'],
      \'%': ['call feedkeys("=%")', 'Indent between current'],
      \'d': ['call feedkeys("cc\<esc>")', 'Clear Line'],
      \'t': ['call feedkeys(":r!date")', "Today's date"],
      \'l': ['call feedkeys("i<C-X><C-L>")', 'Complete Linewise'],
      \'u': ['Denite ultisnips', 'Ultisnips list'],
      \'x': ['call feedkeys("xp")', 'Swap two characters'],
      \}
nnoremap <space>i['='] :call feedkeys("G=gg")<cr>
nnoremap <space>i['%'] :call feedkeys("=%")<cr>
nnoremap <space>id :call feedkeys("cc\<esc>")<cr>
nnoremap <space>it :call feedkeys(":r!date")<cr>
nnoremap <space>il :call feedkeys("i<C-X><C-L>")<cr>
nnoremap <space>iu :Denite ultisnips<cr>
nnoremap <space>ix :call feedkeys("xp")<cr>
" }}}
" └──> BOX DRAWING {{{
let g:nmap.i.b = {
      \'name': 'Box Drawing',
      \'b': ['call Make_into_box()', 'Box current line'],
      \'e': ['call feedkeys("a┬\<esc>")', 'Top T ┬'],
      \'c': ['call feedkeys("a┴\<esc>")', 'Bottom T ┴'],
      \'r': ['call feedkeys("a┐\<esc>")', 'Upper Right ┐'],
      \'s': ['call feedkeys("a├\<esc>")', 'Left T ├'],
      \'f': ['call feedkeys("a┤\<esc>")', 'Right T ┤'],
      \'x': ['call feedkeys("a└\<esc>")', 'Lower Left └'],
      \'w': ['call feedkeys("a┌\<esc>")', 'Upper Left ┌'],
      \'d': ['call feedkeys("a┼\<esc>")', 'Center Cross ┼'],
      \'v': ['call feedkeys("a┘\<esc>")', 'Lower Right ┘'],
      \'t': ['call feedkeys("a─\<esc>")', 'Horizontal Bar ─'],
      \'g': ['call feedkeys("a│\<esc>")', 'Vertical Bar │'],
      \}
nnoremap <space>ibb :call Make_into_box()<cr>
nnoremap <space>ibe a┬<esc>
nnoremap <space>ibc a┴<esc>
nnoremap <space>ibr a┐<esc>
nnoremap <space>ibs a├<esc>
nnoremap <space>ibf a┤<esc>
nnoremap <space>ibx a└<esc>
nnoremap <space>ibw a┌<esc>
nnoremap <space>ibd a┼<esc>
nnoremap <space>ibv a┘<esc>
nnoremap <space>ibt a─<esc>
nnoremap <space>ibg a│<esc>
" }}}
" └──> CASE {{{
let g:nmap.i.c = {
      \'name': 'Case Commands',
      \'.': ['call feedkeys("~")', 'Under Cursor (~)'],
      \'$': ['call feedkeys("g~$")', 'To end of line'],
      \'0': ['call feedkeys("g~0")', 'To end of line'],
      \'c': ['call feedkeys(":s#_\(\l\)#\u\1#g")', 'snake to camel: line'],
      \'C': ['call feedkeys(":s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g")', 'snake to Camel: line'],
      \'l': ['call feedkeys("g~~")', 'Current Line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", "~", "")', 'By motion'],
      \'s': ['call feedkeys(":s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g")', 'camel to snake'],
      \'w': ['call feedkeys("g~iw")', 'Current Word'],
      \}
nnoremap <space>ic['.'] ~
nnoremap <space>ic['$'] g~$
nnoremap <space>ic0 g~0
nnoremap <space>icc :s#_\(\l\)#\u\1#g<cr>
nnoremap <space>icC :s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g<cr>
nnoremap <space>icl g~~
nnoremap <space>icm :call Feedkeys_input_with_timeout("motion: ", "~", "")<cr>
nnoremap <space>ics :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<cr>
nnoremap <space>icw g~iw
" }}}
" └────> downcase {{{
let g:nmap.i.c.d = {
      \'name': 'Downcase Commands',
      \'.': ['call feedkeys("gul")', 'Under cursor'],
      \'w': ['call feedkeys("guiw")', 'Current word'],
      \'l': ['call feedkeys("guu")', 'Current line'],
      \'$': ['call feedkeys("gu$")', 'To end of line'],
      \'0': ['call feedkeys("gu0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", "gu", "")', 'Motion command'],
      \}
nnoremap <space>icd['.'] gul
nnoremap <space>icdw guiw
nnoremap <space>icdl guu
nnoremap <space>icd['$'] gu$
nnoremap <space>icd0 gu0
nnoremap <space>icdm :call Feedkeys_input_with_timeout("motion: ", "gu", "")<cr>
" }}}
" └──> SURROUND {{{
let g:nmap.i.s = {
      \'name': 'Surround',
      \}
" }}}
"   └────> inside {{{
let g:nmap.i.s.i = {
      \'name': 'Inside',
      \}
" }}}
" └──────> SINGLE QUOTES {{{
let g:nmap.i.s.i["\'"] = {
      \'name': 'Single Quotes',
      \ '"': ["call feedkeys('ysi\'\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi\'\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi\'(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi\')')", "Parens"],
      \ "]": ["call feedkeys('ysi\'[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi\']')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi\'}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi\'{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi\'<', '>')", "Xml tag"],
      \}
nnoremap <space>isi["\'"]["\""] :call feedkeys('ysi\'\"')<cr>
nnoremap <space>isi["\'"]["\'"] :call feedkeys(\"ysi\'\")<cr>
nnoremap <space>isi["\'"][")"] :call feedkeys('ysi\'(')<cr>
nnoremap <space>isi["\'"]["("] :call feedkeys('ysi\')')<cr>
nnoremap <space>isi["\'"]["]"] :call feedkeys('ysi\'[')<cr>
nnoremap <space>isi["\'"]["["] :call feedkeys('ysi\']')<cr>
nnoremap <space>isi["\'"]["{"] :call feedkeys('ysi\'}')<cr>
nnoremap <space>isi["\'"]["}"] :call feedkeys('ysi\'{')<cr>
nnoremap <space>isi["\'"]["<"] :call Feedkeys_input('tag (without <>): ', 'ysi\'<', '>')<cr>
" }}}
" └──────> DOUBLE QUOTES {{{
let g:nmap.i.s.i["\""] = {
      \'name': 'Double Quotes',
      \ '"': ["call feedkeys('ysi\"\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi\"\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi\"(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi\")')", "Parens"],
      \ "]": ["call feedkeys('ysi\"[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi\"]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi\"}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi\"{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi\"<', '>')", "Xml tag"]
      \}
nnoremap <space>isi['"']['"'] :call feedkeys('ysi\"\"')<cr>
nnoremap <space>isi['"']['\'] :call feedkeys(\"ysi\"\")<cr>
nnoremap <space>isi['"']['\'] :call feedkeys(\"ysi\"\")<cr>
nnoremap <space>isi['"'][')'] :call feedkeys('ysi\"(')<cr>
nnoremap <space>isi['"']['('] :call feedkeys('ysi\")')<cr>
nnoremap <space>isi['"'][']'] :call feedkeys('ysi\"]')<cr>
nnoremap <space>isi['"']['['] :call feedkeys('ysi\"[')<cr>
nnoremap <space>isi['"']['{'] :call feedkeys('ysi\"{')<cr>
nnoremap <space>isi['"']['}'] :call feedkeys('ysi\"}')<cr>
nnoremap <space>isi['"']['<'] :call Feedkeys_input('tag (without <>): ', 'ysi\"<', '>')<cr>
" }}}
" └> MOVEMENT {{{
let g:nmap.m = {
      \'name': 'Movement',
      \'`': ['call feedkeys("``")', 'Back from last jump'],
      \'a': ['call EasyMotion#JK(0,2)', 'Easymotion jk all'],
      \'j': ['call EasyMotion#JK(0,0)', 'Easymotion down'],
      \'k': ['call EasyMotion#JK(0,1)', 'Easymotion up'],
      \'q': ['call feedkeys("ma")', 'quick mark'],
      \'Q': ['call feedkeys("`a")', 'goto quickmark'],
      \'m': ['call Feedkeys_single_char("mark char: ", "m", "")', 'Create Mark ...'],
      \'M': ['call Feedkeys_single_char("mark char: ", "`", "")', 'Goto Mark ...'],
      \}
nnoremap <space>m['`'] ``
nnoremap <space>ma :call EasyMotion#JK(0,2)<cr>
nnoremap <space>mj :call EasyMotion#JK(0,0)<cr>
nnoremap <space>mk :call EasyMotion#JK(0,1)<cr>
nnoremap <space>mq ma
nnoremap <space>mQ `a
nnoremap <space>mm :call Feedkeys_single_char("mark char: ", "m", "")<cr>
nnoremap <space>mM :call Feedkeys_single_char("mark char: ", "`", "")<cr>
" }}}
" └> SEARCH {{{
let g:nmap.s = {
      \'name': 'Search',
      \'a': ['DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!', 'Search in project'],
      \'c': ['call Feedkeys_input("find/replace",":%s/", "/gc")', 'Int. Search/Replace'],
      \'g': ['Denite grep', 'Grep from .'],
      \'h': ['call feedkeys("q/")', 'Edit Search History'],
      \'i': ['call Feedkeys_input("containing: ",":g/", "/")', 'list lines containing ...'],
      \'w': ['call feedkeys("/\<C-R><C-W><cr>")', 'Search word under cursor'],
      \'r': ['call Feedkeys_input("replace with: ", ":%s\<C-R><C-W>/", "/gc")', 'Search & replace word under cursor'],
      \'t': ['Denite tag', 'Search ctags'],
      \'/': ['call feedkeys("/\\v ", "n")', 'Search forward'],
      \'?': ['call feedkeys("?\\v ", "n")', 'Search backward'],
      \}
nnoremap <space>sa :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<cr>
nnoremap <space>sc :call Feedkeys_input("find/replace",":%s/", "/gc")<cr>
nnoremap <space>sg :Denite grep<cr>
nnoremap <space>sh q/
nnoremap <space>si :call Feedkeys_input("containing: ", ":g/", "/")<cr>
nnoremap <space>sw *
nnoremap <space>sr :call Feedkeys_input("replace with: ", ":%s\<C-R><C-W>/", "/gc")<cr>
nnoremap <space>st :Denite tag<cr>
nnoremap <space>s['/'] /
nnoremap <space>s['?'] ?
" }}}
" └> FILTYPE {{{

" }}}
" └> WORKSPACE {{{
let g:nmap.w = {
      \'name': 'Workspace',
      \'m': ['only', 'maximize/minimize window'],
      \'s': ['split', 'H - Split'],
      \'v': ['vsplit', 'V - Split'],
      \'w': ['Wall', 'Write all windows'],
      \'r': ['set relativenumber', 'Relative Line Numbers'],
      \'R': ['set norelativenumber', 'Normal Line Numbers'],
      \}
nnoremap <space>wm :only<cr>
nnoremap <space>ws :split<cr>
nnoremap <space>wv :vsplit<cr>
nnoremap <space>ww :Wall<cr>
nnoremap <space>wr :set relativenumber<cr>
nnoremap <space>wR :set norelativenumber<cr>
" }}}
" └──> TABS {{{
let g:nmap.w.t = {
      \'name': 'Tab Commands',
      \'n': ['tabnext', 'Next tab'],
      \'N': ['tabprevious', 'Previous tab'],
      \'l': ['tabs', 'List tab and windows'],
      \'g': ['tabfirst', 'Goto first tab'],
      \'G': ['tablast', 'Goto last tab'],
      \'e': ['tabnew', 'Empty new tab'],
      \'f': ['call CmdMenu_feedkeys_input("Filename: ", "tabe")', 'New tab with file ...'],
      \}
nnoremap <space>wtn :tabnext<cr>
nnoremap <space>wtN :tabprevious<cr>
nnoremap <space>wtl :tabs<cr>
nnoremap <space>wtg :tabfirst<cr>
nnoremap <space>wtG :tablast<cr>
nnoremap <space>wte :tabnew<cr>
nnoremap <space>wtf :call CmdMenu_feedkeys_input("Filename: ", "tabe")<cr>
" }}}

let g:nmap.i.s.i["("] = {
      \'name': 'Parens',
      \ '"': ["call feedkeys('ysi(\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi(\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi((')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi()')", "Parens"],
      \ "]": ["call feedkeys('ysi([')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi(]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi(}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi({')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi(<', '>')", "Xml tag"]
      \}

let g:nmap.i.s.i["{"] = {
      \'name': 'Curly Braces',
      \ '"': ["call feedkeys('ysi{\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi{\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi{(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi{)')", "Parens"],
      \ "]": ["call feedkeys('ysi{[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi{]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi{}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi{{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi{<', '>')", "Xml tag"]
      \}

let g:nmap.i.s.i["["] = {
      \ '"': ["call feedkeys('ysi[\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi[\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi[(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi[)')", "Parens"],
      \ "]": ["call feedkeys('ysi[[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi[]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi[}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi[{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi[<', '>')", "Xml tag"],
      \}

let g:nmap.i.s.i["<"] = {
      \'name': 'Pointy Brackets',
      \ '"': ["call feedkeys('ysi<\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysi<\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysi<(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysi<)')", "Parens"],
      \ "]": ["call feedkeys('ysi<[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysi<]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysi<}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysi<{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysi<<', '>')", "Xml tag"]
      \}

let g:nmap.i.s.i.w = {
      \'name': 'Word',
      \ '"': ["call feedkeys('ysiw\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysiw\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysiw(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysiw)')", "Parens"],
      \ "]": ["call feedkeys('ysiw[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysiw]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysiw}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysiw{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysiw<', '>')", "Xml tag"]
      \}

let g:nmap.i.s.i.p = {
      \'name': 'Paragraph',
      \ '"': ["call feedkeys('ysip\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"ysip\")", 'Single Quotes'],
      \ ")": ["call feedkeys('ysip(')", 'Parens with Space'],
      \ "(": ["call feedkeys('ysip)')", "Parens"],
      \ "]": ["call feedkeys('ysip[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('ysip]')", "Square Brackets"],
      \ "{": ["call feedkeys('ysip}')", "Curly Braces"],
      \ "}": ["call feedkeys('ysip{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysip<', '>')", "Xml tag"]
      \}

let g:nmap.i.s.i.l = {
      \'name': 'Line',
      \ '"': ["call feedkeys('yss\"')", 'Double Quotes'],
      \ "\'": ["call feedkeys(\"yss\")", 'Single Quotes'],
      \ ")": ["call feedkeys('yss(')", 'Parens with Space'],
      \ "(": ["call feedkeys('yss)')", "Parens"],
      \ "]": ["call feedkeys('yss[')", "Square Brackets with Space"],
      \ "[": ["call feedkeys('yss]')", "Square Brackets"],
      \ "{": ["call feedkeys('yss}')", "Curly Braces"],
      \ "}": ["call feedkeys('yss{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'yss<', '>')", "Xml tag"],
      \}

let g:nmap.i.s.t = {
      \'name': 'Till',
      \ '"': ["call Feedkeys_single_char('Search until: ', 'yst', '\"')", "Double Quotes"],
      \ "\'": ["call Feedkeys_single_char('Search until: ', 'yst', '\'')", "Single Quotes"],
      \ ")": ["call Feedkeys_single_char('Search until: ', 'yst', '(')", "Parens with Space"],
      \ "(": ["call Feedkeys_single_char('Search until: ', 'yst', ')')", "Parens"],
      \ "]": ["call Feedkeys_single_char('Search until: ', 'yst', '[')", "Square Brackets with Space"],
      \ "[": ["call Feedkeys_single_char('Search until: ', 'yst', ']')", "Square Brackets"],
      \ "{": ["call Feedkeys_single_char('Search until: ', 'yst', '}')", "Curly Braces"],
      \ "}": ["call Feedkeys_single_char('Search until: ', 'yst', '{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'yst<', '>')", "Xml tag"],
      \}

let g:nmap.i.s.f = {
      \'name': 'Forward',
      \ '"': ["call Feedkeys_single_char('Search until: ', 'ysf', '\"')", "Double Quotes"],
      \ "\'": ["call Feedkeys_single_char('Search until: ', 'ysf', '\'')", "Single Quotes"],
      \ ")": ["call Feedkeys_single_char('Search until: ', 'ysf', '(')", "Parens with Space"],
      \ "(": ["call Feedkeys_single_char('Search until: ', 'ysf', ')')", "Parens"],
      \ "]": ["call Feedkeys_single_char('Search until: ', 'ysf', '[')", "Square Brackets with Space"],
      \ "[": ["call Feedkeys_single_char('Search until: ', 'ysf', ']')", "Square Brackets"],
      \ "{": ["call Feedkeys_single_char('Search until: ', 'ysf', '}')", "Curly Braces"],
      \ "}": ["call Feedkeys_single_char('Search until: ', 'ysf', '{')", "Curly Braces with Space"],
      \ "<": ["call Feedkeys_input('tag (without <>): ', 'ysf<', '>')", "Xml tag"],
      \}

let g:nmap.i.s.t = {
      \'name': 'Till',
      \}

let g:nmap.i.s.f = {
      \'name': 'Forward',
      \}


let g:nmap.i.c.u = {
      \'name': 'Upcase Commands',
      \'.': ['call feedkeys("gUl")', 'Under cursor'],
      \'w': ['call feedkeys("gUiw")', 'Current word'],
      \'l': ['call feedkeys("gUU")', 'Current line'],
      \'$': ['call feedkeys("gU$")', 'To end of line'],
      \'0': ['call feedkeys("gU0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", "gU", "")', 'Motion command'],
      \}

let g:nmap.i.d = {
      \'name': 'Delete Commands',
      \'.': ['call feedkeys("x")', 'Under Cursor'],
      \'l': ['call feedkeys("dd")', 'Current Line'],
      \'w': ['call feedkeys("diw")', 'Current Word'],
      \'$': ['call feedkeys("d$")', 'To end of line'],
      \'0': ['call feedkeys("d0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input("motion: ", "d", "")', 'Motion command'],
      \}

let g:nmap.i.d["_"] = {
      \'.': ['call feedkeys("\"_x")', 'Under Cursor'],
      \'l': ['call feedkeys("\"_dd")', 'Current Line'],
      \'w': ['call feedkeys("\"_diw")', 'Current Word'],
      \'$': ['call feedkeys("\"_d$")', 'To end of line'],
      \'0': ['call feedkeys("\"_d0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input("motion: ", "\"_d", "")', 'Motion command'],
      \}

let g:snip_guide = {}

" {{{ javascript snippets
augroup javascript_snippet_switch
  autocmd!
  autocmd FileType javascript,javascript.jsx let g:snip_guide = g:js_snipguide
augroup END

let g:js_snipguide = {
      \'name': 'Javascript Snippets',
      \'>': ['call ExecuteSnippet("=>")', 'Arrow function'],
      \'c': ['call ExecuteSnippet("case")', 'Case Statement'],
      \'e': ['call ExecuteSnippet("add")', 'Add Event Listener'],
      \'f': ['call ExecuteSnippet("func")', 'Function'],
      \'i': ['call ExecuteSnippet("ifelse")', 'If Else'],
      \'k': ['call ExecuteSnippet("class")', 'Class'],
      \'m': ['call ExecuteSnippet("import")', 'Import'],
      \'p': ['call ExecuteSnippet("proms")', 'Promise'],
      \}

let g:js_snipguide.l = {
      \'name': 'Loops',
      \'f': ['call ExecuteSnippet("for")', 'For Loop'],
      \'n': ['call ExecuteSnippet("fin")', 'For in Loop'],
      \}

let g:js_snipguide.d = {
      \'name': 'Debugging',
      \'a': ['call ExecuteSnippet("bingo")', 'Debug alert'],
      \'c': ['call ExecuteSnippet("con")', 'Console Log'],
      \'d': ['call ExecuteSnippet("deb")', 'Debugger'],
      \}

let g:js_snipguide.s = {
      \'name': 'Specs and Testing',
      \'k': ['call ExecuteSnippet("spec-react")', 'React Spec Skeleton'],
      \'d': ['call ExecuteSnippet("des")', 'Describe'],
      \'D': ['call ExecuteSnippet("ddesc")', 'Double Describe'],
      \'w': ['call ExecuteSnippet("wrapper")', 'React el wrapper'],
      \'i': ['call ExecuteSnippet("it")', 'It Block'],
      \}

let g:js_snipguide.w = {
      \'name': 'Web API',
      \'a': ['call ExecuteSnippet("qall")', 'Query Selector All'],
      \'h': ['call ExecuteSnippet("crea")', 'Create Element'],
      \'i': ['call ExecuteSnippet("byid")', 'Get Element By ID'],
      \'l': ['call ExecuteSnippet("add")', 'Add Event Listener'],
      \'q': ['call ExecuteSnippet("qsel")', 'Query Selector'],
      \}

let g:js_snipguide.r = {
    \'name': "React",
    \"v": ['call ExecuteSnippet("proptype-env")', 'Proptype w/ env'],
    \"i": ['call ExecuteSnippet("import-react")', 'Import react'],
    \"p": ['call ExecuteSnippet("import-proptypes")', 'Import Proptypes'],
    \"f": ['call ExecuteSnippet("presenter")', 'Stateless Functional'],
    \"d": ['call ExecuteSnippet("{props}")', 'Destructure Props']
    \}

let g:js_snipguide.r.c = {
    \'name': "Components",
    \"c": ['call ExecuteSnippet("containerRedux")', 'Redux Connected Class'],
    \"d": ['call ExecuteSnippet("rcdm")', 'componentDidMount'],
    \"f": ['call ExecuteSnippet("presenter")', 'Stateless Functional'],
    \"i": ['call ExecuteSnippet("imReactCom")', 'Import React and Component'],
    \"e": ['call ExecuteSnippet("jsx-el")', 'jsx Element'],
    \"p": ['call ExecuteSnippet("={}")', 'Prop={  }']
    \}

let g:js_snipguide.n = {
    \'name': "Node",
    \"m": ['call ExecuteSnippet("vreq")', 'Var = commonJS module'],
    \"o": ['call ExecuteSnippet("stdout")', 'Stdout'],
    \"i": ['call ExecuteSnippet("stdin")', 'Stdin'],
    \"e": ['call ExecuteSnippet("stderr")', 'Stderr']
    \}

let g:js_snipguide.m = {
    \'name': "Module",
    \"a": ['call ExecuteSnippet("import*")', 'import * as'],
    \"i": ['call ExecuteSnippet("import")', 'import'],
    \"r": ['call ExecuteSnippet("iren")', 'import w/Rename'],
    \"n": ['call ExecuteSnippet("{import}")', 'Named Import']
    \}
" }}}

" {{{ ruby snippets
augroup ruby_snippet_switch
  autocmd!
  autocmd FileType ruby let g:snip_guide = g:ruby_snipguide
augroup END

let g:ruby_snipguide = {
      \'name': 'Ruby',
      \'#': ['call ExecuteSnippet("#!")', 'ruby shebang'],
      \'D': ['call ExecuteSnippet("dov")', 'do |v| ... end'],
      \'R': ['call ExecuteSnippet("reqr")', 'require relative'],
      \'b': ['call ExecuteSnippet("beg")', 'begin w/ rescue'],
      \'d': ['call ExecuteSnippet("do")', 'do ... end'],
      \'l': ['call ExecuteSnippet("lam")', 'lambda'],
      \'p': ['call ExecuteSnippet("priv")', 'private'],
      \'r': ['call ExecuteSnippet("req")', 'require'],
      \'z': ['call ExecuteSnippet("frozen")', 'magic frozen comment'],
      \}

let g:ruby_snipguide.a = {
      \'name': 'Attributes',
      \'|': ['call ExecuteSnippet("ivc")', 'instance variable /cache'],
      \'a': ['call ExecuteSnippet("rw")', 'attr accessor'],
      \'e': ['call ExecuteSnippet("exp")', 'expect(...).to'],
      \'i': ['call ExecuteSnippet("it")', 'it "" do'],
      \'r': ['call ExecuteSnippet("r")', 'attr reader'],
      \'w': ['call ExecuteSnippet("w")', 'attr writer'],
      \}

let g:ruby_snipguide.c = {
      \'name': 'Class',
      \'.': ['call ExecuteSnippet("cla")', 'Class .. end'],
      \'d': ['call ExecuteSnippet("def")', 'method def'],
      \'i': ['call ExecuteSnippet("clai")', 'Class .. initialize .. end'],
      \}

let g:ruby_snipguide.m = {
      \'name': 'Methods',
      \'d': ['call ExecuteSnippet("def")', 'method def'],
      \'i': ['call ExecuteSnippet("definit")', 'initialize def'],
      \}

let g:ruby_snipguide.i = {
      \'name': 'Iterators',
      \'e': ['call ExecuteSnippet("ea")', 'each {  }'],
      \'E': ['call ExecuteSnippet("ead")', 'each do ... end'],
      \'i': ['call ExecuteSnippet("eawi")', 'each w/index {  }'],
      \'I': ['call ExecuteSnippet("eawid")', 'each w/index do ... end'],
      \'r': ['call ExecuteSnippet("red")', 'reduce {  }'],
      \'R': ['call ExecuteSnippet("redd")', 'reduce do ... end'],
      \'m': ['call ExecuteSnippet("map")', 'map {  }'],
      \'M': ['call ExecuteSnippet("mapd")', 'map do ... end'],
      \'s': ['call ExecuteSnippet("sel")', 'select {  }'],
      \'S': ['call ExecuteSnippet("seld")', 'select do ... end'],
      \}

let g:ruby_snipguide.f = {
      \'name': 'Control Flow',
      \'c': ['call ExecuteSnippet("case")', 'case statement'],
      \'i': ['call ExecuteSnippet("if")', 'if statement'],
      \'I': ['call ExecuteSnippet("ifee")', 'if/elsif/else'],
      \'f': ['call ExecuteSnippet("ife")', 'if/else statement'],
      \'l': ['call ExecuteSnippet("eif")', 'elsif'],
      \}

let g:ruby_snipguide.s = {
      \'name': 'Spec',
      \'d': ['call ExecuteSnippet("desc")', 'describe'],
      \'b': ['call ExecuteSnippet("bef")', 'before do'],
      \'a': ['call ExecuteSnippet("aft")', 'after do'],
      \'l': ['call ExecuteSnipper("let")', 'let'],
      \}
" }}}

" {{{ funcs
func! GetKeyWithTimeout(...) " {{{
  let timeout_length = &timeoutlen
  if a:0>0
    echo a:0
  else
    echo "Press a key sequence to continue"
  endif
  let tmfac = timeout_length / 50
  let key = ""
  let phrase = ""
  while tmfac > 0
      let key = s:getkey()
      if key == "<esc>"
        break
      elseif key != ""
        let phrase = phrase . key
        let tmfac = timeout_length / 50
        let key = ""
      endif
      sleep 50m
      let tmfac -= 1
  endwhile
  redraw
  return phrase
endfunc " }}}

func! s:getkey() " {{{
  if getchar(1)
      let key = getchar()
      if key == 27
        return "<esc>"
      elseif key == 32
        return "<space>"
      endif
      if key>0
          let key = nr2char(key)
      endif
  else
      let key = ""
  endif
  return key
endfunc " }}}

function! CmdMenu_feedkeys_input(prompt, command) " {{{
  let finput = input(a:prompt)
  call feedkeys(':' . a:command . ' ' . finput . "\<cr>")
endfunction " }}}

function! Feedkeys_single_char(prompt, before_keys, after_keys) " {{{
  echo a:prompt
  let fchar = nr2char(getchar())
  call feedkeys(before_keys . fchar . after_keys, 'n')
endfunction " }}}

function! Feedkeys_needs_confirm(prompt, command) " {{{
  echo a:prompt
  let fchar = nr2char(getchar())
  if fchar == "y"
    call feedkeys(command, 'n')
  else
    silent !echo 'Action aborted'
    execute 'redraw!'
  endif
endfunction " }}}

function! Feedkeys_input(prompt, before_keys, after_keys) " {{{
  let finput = input(a:prompt)
  call feedkeys(before_keys . finput . after_keys, 'n')
endfunction " }}}

function! Feedkeys_input_with_timeout(prompt, before_keys, after_keys) " {{{
  let finput = GetKeyWithTimeout(a:prompt)
  call feedkeys(before_keys . finput . after_keys, 'n')
endfunction " }}}

function! Set_syntax_colors() " {{{
  if exists('b:current_syntax')
      finish
  endif
  let b:current_syntax = "leaderguide"

  syn region LeaderGuideKeys start="\["hs=e+1 end="\]\s"he=s-1
              \ contained
  syn region LeaderGuideBrackets start="\(^\|\s\+\)\[" end="\]\s\+"
              \ contains=LeaderGuideKeys keepend
  syn region LeaderGuideDesc start="^" end="$"
              \ contains=LeaderGuideBrackets

  hi def link LeaderGuideDesc Identifier
  hi def link LeaderGuideKeys Type
  hi def link LeaderGuideBrackets Delimiter
endfunction " }}}

function! ExecuteSnippet(snip) " {{{
  execute "normal! i" . a:snip . "\<C-R>=UltiSnips#ExpandSnippet()\<CR>\<esc>la"
endfunction " }}}
