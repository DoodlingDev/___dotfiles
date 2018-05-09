function! Make_into_box()
  let selection = getline(".")
  let chars_of_selection = len(selection)
  let selection_plus_gutters = chars_of_selection + 6
  let box_with_title = "┌" . repeat("─", selection_plus_gutters) . "┐\n│   " . selection . "   │\n" . "└" . repeat("─", selection_plus_gutters) . "┘\n"
  exe "normal ddi" . box_with_title . "\<esc>"
endfunction



