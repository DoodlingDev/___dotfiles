" let g:lmap = {}
"
" " buffer management
" let g:lmap.b = { 'name': 'Buffer Commands' }
" let g:lmap.b.l = [':ls', 'list open buffers']
" let g:lmap.b.b = ['call feedkeys(":b")', 'open buffer ...']
" let g:lmap.b.c = ['checkt', 'Reload buffers from disk']
"
" " editing
" let g:lmap.i = {'name': 'Insert'}
" let g:lmap.i.s = ['sort u', 'Sort selected']
" let g:lmap.i.d = ['"_dd', 'Bufferless delete line']
" let g:lmap.i.dw = ['"_daw', 'Bufferless delete word']
"
" let g:lmap.i.c = {'name': 'Change Case'}
" let g:lmap.i.c.m = ['call feedkeys("\g\~")', 'Switch case of {motion}']
" " let g:lmap.i.c.
"
" " git
" let g:lmap.g = {'name': 'Git commands'}
" let g:lmap.g.s = ["Gstatus", "Status"]
" let g:lmap.g.c = ["Gcommit -v", "Commit -verbose"]
" let g:lmap.g.p = ["call feedkeys(':Gpush ')", "Git Push ..."]
" let g:lmap.g.l = ["Gpull", "Git Pull"]
" let g:lmap.g.d = ["Gdiff", "Diff"]
" let g:lmap.g.q = ["Glog", "Load revisions to QuickFix"]
"
" " tabs/windows/splits
" let g:lmap.t = {'name': 'Windows/Tabs/Splits'}
" let g:lmap.t.v = [':vsplit', 'Split Vertical']
" let g:lmap.t.h = [':split', 'Split Horizontal']
"
" " file control
" let g:lmap.f = {'name': 'File'}
" let g:lmap.f.w = [':w', 'Write current buffer']
" let g:lmap.f.g = ['call feedkeys("gf")', 'Goto file under cursor']
" let g:lmap.f.r = ['call feedkeys(":r ")', 'Insert file at cursor ...']
" let g:lmap.f.v = ['source $MYVIMRC', 'source vimrc']
" let g:lmap.f.c = ['checkt', 'Reload buffers from disk']
" let g:lmap.f.q = ['q', 'Quit current buffer']
" let g:lmap.f.Q = ['qall!', 'Quit all']
" let g:lmap.f.e = ['call feedkeys(":e ")', 'Edit file ...']
" let g:lmap.f.rc = ['tabe $MYVIMRC', 'Open vimrc in split']
" let g:lmap.f.s = ['tabe $shortcuts', 'Open leader-guide file']
" let g:lmap.f.RC = ['call feedkeys(":tabe $MYVIMRC\<CR>:vsplit\<cr>:e $shortcuts\<cr>")', 'Open vimrc and leaderGuide file']
" " let g:lmap.f.R = ['call feedkeys(":vsplit\<cr>:terminal\<cr>rr\<cr>")', 'Ranger (vsplit)']
"
" " shell commands
" let g:lmap.z = {'name': 'Shell Commands'}
" let g:lmap.z["!"] = ['call feedkeys(":!")', 'Execute shell command ...']
"
" " registers
" let g:lmap.r = {'name': 'Registers'}
" let g:lmap.r.l = ['reg', 'List all registers']
"
" " screen/cursor
" let g:lmap.c = {'name': 'Cursor'}
" let g:lmap.c.c = ['call feedkeys("z.")', 'Center on cursor']
" let g:lmap.c.t = ['call feedkeys("zt")', 'Scroll to cursor at top']
" let g:lmap.c.b = ['call feedkeys("zb")', 'Scroll to cursor at bottom']
" let g:lmap.c.p = ['call feedkeys("`\"")', 'Goto last cursor position']
" let g:lmap.c.i = ['call feedkeys("`.")', 'Goto position of last edit']
" let g:lmap.c['^'] = ['call feedkeys("`^")', 'Goto position of last insert']
"
" " search
" let g:lmap.s = {'name': 'Search'}
" let g:lmap.s.h = ['call feedkeys("q/")', 'Edit Search History']
" let g:lmap.s['/'] = ['call feedkeys("/")', 'Search this buffer']
" let g:lmap.s.a = ['call feedkeys(":Ag ")', 'Silver Searcher']
" let g:lmap.s.n = ['noh', 'Unhilight search term']
"
" " marks
" let g:lmap.m = {'name': 'Marks'}
"
" " Plugins
" " DevDocs
" let g:lmap.p = {'name': 'Plugins'}
" let g:lmap.p.d = {'name': 'DevDocs'}
" let g:lmap.p.d.c = [':DevDocsUnderCursor', 'Search Dev Docs at cursor']
" let g:lmap.p.d.s = [':DevDocs %', 'Search']
"
" " CtrlP
" let g:lmap.p.p = {'name': 'Ctrl-P fuzzy file finder'}
" let g:lmap.p.p.p = ['CtrlP', 'Open fuzzy finder']
" let g:lmap.p.p.c = ['CtrlPCmdPalette', 'Open Control Palette']
"
" " NerdTree
" let g:lmap.p["\\"] = {'name': 'NERDTree'}
" let g:lmap.p["\\"].o = ['NERDTree', 'Open NERDTree']
"
" " Prettier
" silent! unmap <leader>p
" let g:lmap.p.r = {'name': 'Prettier'}
" let g:lmap.p.r.f = ['PrettierAsync', 'Format current buffer']
"
" " Tabularize
" let g:lmap.p.t = {'name': 'Tabularize'}
" let g:lmap.p.t.a = ['Tab', 'Auto Tabularize']
" let g:lmap.p.t.g = ['call feedkeys(":Tab /")', 'Tabularize on ...']
" let g:lmap.p.t.s = ['call feedkeys(":sort<space>u<cr>gv:Tabularize/:")', 'Sort and tab on ...']
" let g:lmap.p.t[':'] = ['Tabularize/:/', 'Tabularize on :']
" let g:lmap.p.t['='] = ['Tabularize/=/', 'Tabularize on =']
"
"
