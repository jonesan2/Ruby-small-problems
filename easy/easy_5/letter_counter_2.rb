def word_size_letters_only(word)
  word.gsub(/[^\w]+/, '').size
end

def word_sizes(text)
  result = Hash.new(0)
  text.split(' ').each do |word|
    word_size = word_size_letters_only(word)
    result[word_size] += 1
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
