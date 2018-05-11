nnoremap <space> :LeaderGuideD g:nmap<cr>

let g:leaderGuide_run_map_on_popup=0
let g:nmap = {'name': 'Mission Control',
      \'h': ['call CmdMenu_feedkeys_input("help for: ", "h ")', 'help ...'],
      \'q': ['q', 'Close Current Buffer'],
      \'Q': ['q', 'Close Current Buffer w/o save'],
      \'r': ['call feedkeys("\<C-r>", "n")', 'redo'],
      \'u': ['u', 'undo'],
      \'=': ['call feedkeys("==", "n")', 'format line'],
      \'+': ['call Feedkeys_input("motion", {"before_keys": "=", "after_keys": ""})', 'format w/ motion'],
      \'[': ['call feedkeys("mwO\<esc>`w", "n")', 'blank line above'],
      \']': ['call feedkeys("mwo\<esc>`w", "n")', 'blank line below'],
      \}

let g:nmap.b = {
      \'name': 'Buffer',
      \'a': ['ball', 'open one window for each buffer'],
      \'A': ['sball', 'open one split for each buffer'],
      \'c': ['checkt', 'reload buffers from disk'],
      \'d': ['Denite buffer -default-action=delete -force-quit', 'list buf and delete'],
      \'g': ['call feedkeys("gg", "n")', 'Scroll to top'],
      \'G': ['call feedkeys("G", "n")', 'Scroll to bottom'],
      \'l': ['Denite buffer', 'list buffers'],
      \'o': ['call CmdMenu_feedkeys_input("file: ", {"before_keys": "badd", "after_keys": ""})', 'file in buffer w/o opening'],
      \'s': ['split scratch', 'open scratch buffer in split'],
      \'S': ['tabe scratch', 'open scratch buffer in tab'],
      \'u': ['bdelete', 'delete current buffer'],
      \'U': ['bdelete!', 'delete current buffer w/o write'],
      \'v': ['Denite buffer -default-action=vsplit', 'list buffers and open w/split'],
      \'w': ['w', 'write current buffer'],
      \}

let g:nmap.c = {
      \'name': 'Cursor',
      \'b': ['call feedkeys("zb", "n")', 'Scroll to cursor at bottom'],
      \'c': ['call feedkeys("z.", "n")', 'Center on cursor'],
      \'g': ['call feedkeys("gg", "n")', 'Scroll to top'],
      \'G': ['call feedkeys("G", "n")', 'Scroll to bottom'],
      \'i': ['call feedkeys("`.", "n")', 'Goto position of last edit'],
      \'l': ['call Feedkeys_input("line no: ", {"before_keys": "", "after_keys":"G"})', 'Goto line #...'],
      \'p': ['call feedkeys("`\", "n")', 'Goto last cursor position'],
      \'t': ['call feedkeys("zt", "n")', 'Scroll to cursor at top'],
      \'^': ['call feedkeys("`^", "n")', 'Goto position of last insert'],
      \}

let g:nmap.f = {
      \'name': 'File',
      \'*': ['call feedkeys("gf")', 'Goto file under cursor'],
      \'b': ['e "%:p:h"', 'Open cwd'],
      \'c': ['checkt', 'Reload Buffers from disk'],
      \'d': ['call Feedkeys_input("new path: ", {"before_keys": ":w", "after_keys": "%:r"})', 'Save in new directory'],
      \'e': ['Denite file_rec', 'Search files'],
      \'G': ['call feedkeys("\<C-G>", "n")', 'Where am I?'],
      \'i': ['call feedkeys(":r ", "n")', 'Insert file at cursor ...'],
      \'k': ['call feedkeys(":Mkdir ")', 'Make dir'],
      \'m': ['call feedkeys(":Move ")', 'Move file on disk'],
      \'q': ['q', 'Close current buffer'],
      \'Q': ['q!', 'Close buffer w/o write'],
      \'r': ['call feedkeys(":Rename ")', 'Rename in place'],
      \'v': ['call feedkeys(":tabe\<space>$MYVIMRC\<cr>:vsplit\<cr>\<c-l>:e\<space>~/.dotfiles/config/nvim/vundle.vim\<cr>\<c-w>h")', 'Open vimrc'],
      \'w': ['w', 'Write current buffer'],
      \'W': ['wq', 'Write and quit current'],
      \'x': ['call feedkeys(":Delete ")', 'Delete buffer and file'],
      \}

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

let g:nmap.i.s = {
      \'name': 'Surround',
      \}

let g:nmap.i.s.i = {
      \'name': 'Inside',
      \}

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

let g:nmap.i.s.i["("] = {
      \'name': 'Single Quotes',
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

let g:nmap.i.c = {
      \'name': 'Case Commands',
      \'.': ['call feedkeys("~")', 'Under Cursor (~)'],
      \'$': ['call feedkeys("g~$")', 'To end of line'],
      \'0': ['call feedkeys("g~0")', 'To end of line'],
      \'c': ['call feedkeys(":s#_\(\l\)#\u\1#g")', 'snake to camel: line'],
      \'C': ['call feedkeys(":s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g")', 'snake to Camel: line'],
      \'l': ['call feedkeys("g~~")', 'Current Line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", {"before_keys": "~"})', 'By motion'],
      \'s': ['call feedkeys(":s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g")', 'camel to snake'],
      \'w': ['call feedkeys("g~iw")', 'Current Word'],
      \}

let g:nmap.i.c.d = {
      \'name': 'Downcase Commands',
      \'.': ['call feedkeys("gul")', 'Under cursor'],
      \'w': ['call feedkeys("guiw")', 'Current word'],
      \'l': ['call feedkeys("guu")', 'Current line'],
      \'$': ['call feedkeys("gu$")', 'To end of line'],
      \'0': ['call feedkeys("gu0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", {"before_keys": "gu"})', 'Motion command'],
      \}

let g:nmap.i.c.u = {
      \'name': 'Upcase Commands',
      \'.': ['call feedkeys("gUl")', 'Under cursor'],
      \'w': ['call feedkeys("gUiw")', 'Current word'],
      \'l': ['call feedkeys("gUU")', 'Current line'],
      \'$': ['call feedkeys("gU$")', 'To end of line'],
      \'0': ['call feedkeys("gU0")', 'To beginning of line'],
      \'m': ['call Feedkeys_input_with_timeout("motion: ", {"before_keys": "gU"})', 'Motion command'],
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

let g:nmap.m = {
      \'name': 'Movement',
      \'`': ['call feedkeys("``")', 'Back from last jump'],
      \'a': ['call EasyMotion#JK(0,2)', 'Easymotion jk all'],
      \'j': ['call EasyMotion#JK(0,0)', 'Easymotion down'],
      \'k': ['call EasyMotion#JK(0,1)', 'Easymotion up'],
      \'q': ['call feedkeys("ma")', 'quick mark'],
      \'Q': ['call feedkeys("`a")', 'goto quickmark'],
      \'m': ['call Feedkeys_single_char("mark char: ", {"before_keys": "m"})', 'Create Mark ...'],
      \'M': ['call Feedkeys_single_char("mark char: ", {"before_keys": "`"})', 'Goto Mark ...'],
      \}

let g:nmap.s = {
      \'name': 'Search',
      \'a': ['DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!', 'Search in project'],
      \'c': ['call Feedkeys_input("find/replace", {"before_keys":":%s/","after_keys":"/gc"})', 'Int. Search/Replace'],
      \'g': ['Denite grep', 'Grep from .'],
      \'h': ['call feedkeys("q/")', 'Edit Search History'],
      \'i': ['call Feedkeys_input("containing: ", {"before_keys":":g/","after_keys":"/"})', 'list lines containing ...'],
      \'w': ['call feedkeys("/\<C-R><C-W><cr>")', 'Search word under cursor'],
      \'r': ['call Feedkeys_input("replace with: ",{"before_keys":":%s\<C-R><C-W>/","after_keys":"/gc"})', 'Search & replace word under cursor'],
      \'t': ['Denite tag', 'Search ctags'],
      \'/': ['call feedkeys("/\\v ", "n")', 'Search forward'],
      \'?': ['call feedkeys("?\\v ", "n")', 'Search backward'],
      \}

let g:nmap.v = {
      \'name': 'Editor',
      \'r': ['call feedkeys(":tabe\<space>$MYVIMRC\<cr>:vsplit\<cr>\<c-l>:e\<space>~/.dotfiles/config/nvim/vundle.vim\<cr>\<c-w>h")', 'Open vimrc'],
      \}

let g:nmap.w = {
      \'name': 'Workspace',
      \'s': ['split', 'H - Split'],
      \'v': ['vsplit', 'V - Split'],
      \'w': ['Wall', 'Write all windows'],
      \}

let g:nmap.w.t = {
      \'name': 'Tab Commands',
      \'n': ['tabnext', 'Next tab'],
      \'N': ['tabprevious', 'Previous tab'],
      \'l': ['tabs', 'List tab and windows'],
      \'g': ['tabfirst', 'Goto first tab'],
      \'G': ['tablast', 'Goto last tab'],
      \'e': ['tabe', 'Empty new tab'],
      \'f': ['call CmdMenu_feedkeys_input("Filename: ", "tabe")', 'New tab with file ...'],
      \}

let g:snip_guide = {}

" {{{ javascript snippets
autocmd FileType javascript,javascript.jsx let g:snip_guide = g:js_snipguide

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
autocmd FileType ruby let g:snip_guide = g:ruby_snipguide

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

function! Feedkeys_single_char(prompt, options) " {{{
  echo a:prompt
  let fchar = nr2char(getchar())
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ""
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

function! Feedkeys_input(prompt, options) " {{{
  let finput = input(a:prompt)
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ""
  call feedkeys(before_keys . finput . after_keys, 'n')
endfunction " }}}

function! Feedkeys_input_with_timeout(prompt, options) " {{{
  let finput = GetKeyWithTimeout(a:prompt)
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ''
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

let g:snip_guide = {}
function! ExecuteSnippet(snip)
  execute "normal! i" . a:snip . "\<C-R>=UltiSnips#ExpandSnippet()\<CR>\<esc>la"
endfunction

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

function! Feedkeys_single_char(prompt, options) " {{{
  echo a:prompt
  let fchar = nr2char(getchar())
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ""
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

function! Feedkeys_input(prompt, options) " {{{
  let finput = input(a:prompt)
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ""
  call feedkeys(before_keys . finput . after_keys, 'n')
endfunction " }}}

function! Feedkeys_input_with_timeout(prompt, options) " {{{
  let finput = GetKeyWithTimeout(a:prompt)
  let before_keys = options.before_keys ? options.before_keys : ""
  let after_keys = options.after_keys ? options.after_keys : ''
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

let g:snip_guide = {}
function! ExecuteSnippet(snip)
  execute "normal! i" . a:snip . "\<C-R>=UltiSnips#ExpandSnippet()\<CR>\<esc>la"
endfunction
" }}}
