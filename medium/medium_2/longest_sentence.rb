# uses File.read

def longest_sentence(text)
  words = text.split(' ')
  word_cache = []
  longest_sentence = []
  loop do
    word_cache << words.shift
    if word_cache[-1] =~ /[.?!]$/
      if word_cache.size > longest_sentence.size
        longest_sentence = word_cache
      end
      word_cache = []
    end
    break if words.empty?
  end
  p longest_sentence.join(' ')
  p longest_sentence.size
end

text = File.read('frankenstein.txt')
longest_sentence(text)