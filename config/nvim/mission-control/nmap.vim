let g:normal_guide = [
  \'VIM-pressive KeyGuide',
  \['b', 'ruby $key_guide.new(Vim.evaluate("g:buffer_guide"))', 'buffer commands'],
  \['C', 'ruby $key_guide.new(Vim.evaluate("g:cursor_guide"))', 'CURSOR'],
  \['h', 'call CmdMenu_feedkeys_input("help for: ", ":h ")', 'help ...'],
  \['j', 'execute "normal \<Plug>(easymotion-j)"', 'easymotion down'],
  \
  \['m', 'call feedkeys("ma")', 'quick mark'],
  \['M', 'call feedkeys("`a")', 'goto quickmark'],
  \
  \['q', 'q', 'close current buffer'],
  \['Q', 'q!', 'close buffer w/o write'],
  \['r', 'call feedkeys("\<C-r>", "n")', 'redo'],
  \['s', 'split', 'H - Split'],
  \
  \['u', 'u', 'undo'],
  \['v', 'vsplit', 'V - Split'],
  \['w', 'w', 'write current buffer'],
  \['=', 'call feedkeys("==", "n")', 'format line'],
  \['+', 'call Feedkeys_input("motion", "=", "")', 'format w/ motion'],
  \['/', 'call feedkeys("/\\v", "n")', 'search forward'],
  \['?', 'call feedkeys("?\\v", "n")', 'search backward'],
  \['[', 'call feedkeys("mwO\<esc>`w", "n")', 'blank line above'],
  \[']', 'call feedkeys("mwo\<esc>`w", "n")', 'blank line below'],
\]

let g:buffer_guide = [
  \'BUFFER',
  \['a', 'ball', 'open one window for each buffer'],
  \['A', 'sball', 'open one split for each buffer'],
  \['c', 'checkt', 'reload buffers from disk'],
  \['d', 'Denite buffer -default-action=delete -force-quit', 'list buf and delete'],
  \['l', 'Denite buffer', 'list buffers'],
  \['o', 'call CmdMenu_feedkeys_input("file: ", "badd")', 'file in buffer w/o opening'],
  \['s', 'split scratch', 'open scratch buffer in split'],
  \['S', 'tabe scratch', 'open scratch buffer in tab'],
  \['u', 'bdelete', 'delete current buffer'],
  \['U', 'bdelete!', 'delete current buffer w/o write'],
  \['v', 'Denite buffer -default-action=vsplit', 'list buffers and open w/split'],
\]

let g:cursor_guide = []
