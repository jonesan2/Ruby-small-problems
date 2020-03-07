# MULTIPLE-ASSIGNMENT SYNTAX
#
# The common way to exchange two elements is this idiom:
#
#       a, b = b, a
#
#  My original word_flip function:
#
#  def word_flip(word)
#    char_array = word.chars
#    first_letter = char_array.first
#    char_array[0] = char_array.last
#    char_array[-1] = first_letter
#    char_array.join
#  end

def word_flip(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(sentence)
  sentence.split(' ').map { |word| word_flip(word) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
