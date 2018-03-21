class KeyGuide
  attr_reader :keymap_name, :keymap_dictionary, :menu_list, :menu_string, :menu_window, :starting_window_number
  def initialize(keymap_dictionary_from_vim_global)
    # {{{
    $current_key_guide = self
    VIM.command("normal! mz")
    @starting_window_number = VIM.evaluate("win_getid()")
    @keymap_name = keymap_dictionary_from_vim_global[0]
    @keymap_dictionary = keymap_without_name(keymap_dictionary_from_vim_global)
    generate_contents
    append_menu_output_to_buffer
    VIM.command("redraw")
    user_input = VIM.evaluate("nr2char(getchar())")
    execute(user_input)
  end
  # }}}

  def generate_contents
    @menu_window = MenuWindow.new(1, keymap_name)
    generate_menu_string
  end

  def append_menu_output_to_buffer
    VIM.command("call Set_syntax_colors()")
    menu_window.height = menu_list.count_number_of_rows
    menu_list.strings.each_with_index do |row, i|
      VIM::Buffer.current.append(i, row)
    end
  end

  def keymap_without_name(vim_dictionary)
    vim_dictionary.delete_at(0)
    vim_dictionary
  end

  def display_window
    MenuWindow.new(10, keymap_name)
  end

  def generate_menu_string
    @menu_list = MenuList.new(keymap_dictionary, menu_window.width)
  end

  def set_local_mappings
    keymap_dictionary.each do |keymap_data|
      trigger = keymap_data[0]
      action = keymap_data[1]
      VIM.command "nnoremap <buffer><silent> #{trigger} \
                   :ruby<space>$current_key_guide.execute('#{action}')<cr>"
    end
  end

  def execute(char)
    VIM.command "bdelete! #{keymap_name.gsub(' ', '\ ')}"
    action = ""
    keymap_dictionary.each do |keymap_data|
      if keymap_data[0] == char
        action = keymap_data[1]
        break
      end
    end
    VIM.command("call win_gotoid(#{starting_window_number})")
    VIM.command("normal! `z")
    VIM.command action
  end
end

class MenuWindow
  def initialize(height, title)
    # {{{
    VIM.command "silent botright 1split #{title}"
    @vim_window = VIM::Window.current
    @vim_window.height = height
  end
  # }}}

  def width
    @vim_window.width
  end

  def height
    @vim_window.height
  end

  def height=(new_height)
    @vim_window.height = new_height
  end
end

class MenuList
  attr_reader :window_width, :dictionary, :strings
  def initialize(dict, window_width)
    @dictionary = dict
    @window_width = window_width
    build_menu_strings
  end

  def build_menu_strings
    # {{{
    # find longest label in the hash
    longest_hash_label = longest_label
    # divide width by longest label + [ char ]
    longest_label_plus_interface = longest_hash_label[1] + 5
    per_row = window_width / longest_label_plus_interface
    # # build rows based on that number
    @strings = render_menu(per_row)
    # # append to window
  end
  # }}}

  def count_number_of_rows
    strings.length
  end

  private # {{{

    def longest_label
      longest = "" # {{{
      longest_length = 0
      dictionary.each do |keymap_data|
        label = keymap_data[2]
        if label.to_s.length > longest_length
          longest_length = label.to_s.length
          longest = label.to_s
        end
      end
      [longest, longest_length]
    end
    # }}}

    def render_menu(per_row)
      # {{{
      rows_count = dictionary.length / per_row
      rows_count += 1 if dictionary.length % per_row > 0

      column_width = window_width / per_row

      column_counter = 1
      output_buffer = Array.new(rows_count, "")
      dictionary.each do |keymap_data|
        trigger = keymap_data[0]
        label = keymap_data[2]

        map_buffer = "[#{trigger}] #{label} ".ljust(column_width, " ")
        output_buffer[column_counter] += map_buffer

        column_counter += 1
        column_counter = 1 if column_counter >= rows_count
      end
      output_buffer
    end
  # }}}
  # }}}
end

$key_guide = KeyGuide
