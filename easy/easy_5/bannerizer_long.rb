# I really struggled on this one to find a way to get Rubocop not co complain
# that my method was too long or complex or had an ABC count too high. I 
# could not come up with a way to simplify the create_lines_from_words
# method any further.

MAX_WIDTH = 80
MARGIN = 2
TEXT_WIDTH = MAX_WIDTH - MARGIN * 2

def fill_out_line(line_str)
  line_str = line_str.chop
  line_str << ' ' until line_str.length >= TEXT_WIDTH
  line_str
end

def create_lines_from_words(words)
  lines = ['']
  line_num = 0
  words.each do |word|
    if lines[line_num].length + word.length > TEXT_WIDTH
      lines[line_num] = fill_out_line(lines[line_num])
      line_num += 1
      lines[line_num] = ''
    end
    lines[line_num] << word + ' '
  end
  lines[line_num] = fill_out_line(lines[line_num]) unless line_num.zero?
  lines
end

def create_lines_from_text(text)
  words = text.split(' ')
  create_lines_from_words(words)
end

def print_top_bot(text_width)
  puts "+#{'-' * (text_width + MARGIN)}+"
end

def print_empty_line(text_width)
  puts "|#{' ' * (text_width + MARGIN)}|"
end

def print_in_box(text)
  lines = create_lines_from_text(text)
  box_width = lines.size > 1 ? TEXT_WIDTH : lines[0].length

  print_top_bot(box_width)
  print_empty_line(box_width)
  lines.each { |line| puts "| #{line} |" }
  print_empty_line(box_width)
  print_top_bot(box_width)
end

print_in_box('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit id est laborum.')
print_in_box('To boldy go where no one has gone before.')
print_in_box('')
