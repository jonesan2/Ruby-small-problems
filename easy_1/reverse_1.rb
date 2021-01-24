# Reverse It (Part 1)
#
# Things to learn:
#   1) Remember that ' ' is the default delimiter for String#split
#
# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.
#
# UtP:
#   -Convert string to words
#   -Reverse the order of the words
#   -Recombine words into a new string
#
# Examples:
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# DS:
#   String to Array to Reversed Array to String
#
# Algorithms:
#   Split, Reverse, Join

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
