def print_in_box(text)
  width = text.length + 2
  top_bot = '+' + '-' * width + '+'
  two_four = '|' + ' ' * width + '|'
  puts top_bot, two_four
  puts '|' + ' ' + text + ' ' + '|'
  puts two_four, top_bot
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
