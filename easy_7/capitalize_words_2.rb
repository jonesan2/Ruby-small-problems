def word_cap(str)
  cap_words = str.split.map do |word|
    new_word = word.downcase
    new_word[0] = word[0].upcase
    new_word
  end
  cap_words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
