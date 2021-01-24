# Note: keep the String#delete method in mind
#        It depends on String#count for its syntax
#
# Problem: Remove all vowels from an array of strings. 
#          Return a different array. 
# Algorithm:
# 1) Iterate over each string
# 2) Iterate over each character
# 3) Reject the character if it is a vowel
# 4) Add the new string to a new array

def remove_vowels(arr_of_strings)
  arr_of_strings.map do |str|
    str.chars.reject { |char| char.downcase.match(/[aeiou]/) }.join
  end 
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
