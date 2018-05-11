" create a log file using the current date as filename
" credit to paulhodge on GitHub
" https://gist.github.com/paulhodge/2770949
"
function! OpenLog()
  let file_name = strftime("%b_%d_%Y")
  exe ":e ~/Dropbox/notes/" . file_name . ".md"
  let file_heading = strftime("%b %d, %Y")
  exe "normal iEngineering Log: " . file_heading . "\<esc>"
  call Make_into_box()
endfunction
command L call OpenLog()
