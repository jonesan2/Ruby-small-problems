def word_cap(str)
  letters = str.chars
  letters[0].upcase!
  letters.each_with_index do |chr, idx|
    if (chr == ' ' && letters[idx + 1])
      letters[idx + 1].upcase!
    end
  end.join
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')