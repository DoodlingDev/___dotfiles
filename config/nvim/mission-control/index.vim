rubyfile ~/dev/vim-mission-control/plugin/mission_control.rb

exec 'source ~/.dotfiles/config/nvim/mission-control/nmap.vim'
exec 'source ~/.dotfiles/config/nvim/mission-control/imap.vim'
exec 'source ~/.dotfiles/config/nvim/mission-control/vmap.vim'

nnoremap <silent> <space> ruby $mission_controller.new(VIM.evaluate("g:normal_guide"))

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

