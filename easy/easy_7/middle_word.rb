def middle_word(str)
  if !str.is_a?(String)
    puts 'Error: Input must be a string.'
    nil
  else
    words = str.split
    return '' if words == []
    length = str.split.size
    length.even? ? words.slice(length / 2 - 1, 2) : words.slice(length / 2)
  end
end

p middle_word('Every good boy does fine.')
p middle_word('George')
p middle_word('')
p middle_word('I got stuck in Des Moines')
p middle_word('Kick his butt')
p middle_word(' ')
p middle_word('...')
p middle_word('  thumb  ')
