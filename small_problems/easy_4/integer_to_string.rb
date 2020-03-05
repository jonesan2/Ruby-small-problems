# An array works just as well, and more simply, than a hash for the data
# If the hash keys are going to be consecutive integers, might as well
# use an array!
#
# List of mutating String methods that don't end with '!':
#   String#<<
#   String#=   Assignment mutates the string on the Left. The string on the
#               Right is not mutated, but it will now have the same reference
#               as the string on the Left, and any mutation of the string on
#               the Left will affect the string on the Right. 
#   String#clear      makes the string empty
#   String#concat(obj1, obj2, ...)      concats these objs to the end of string
#   String#insert(index, other_str)
#   String#prepend(other_str1, other_str2, ...)
#   String#replace     replaces the string with a new one
#   String#setbyte(index, integer)
#
# I couldn't find any non-mutating String methods that end with '!'.
# I couldn't find any non-mutating Array methods that end with '!'.
# I couldn't find any non-mutating Hash methods that end with '!'.
# I didn't read all the documentation for the ! methods. All I did was look to
#   see if there were any (!) methods that didn't have a corresponding method
#   of the same name but without the '!'. 


DIGIT_STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].freeze

def integer_to_string(input)
  result = input.zero? ? '0' : ''
  while input > 0
    result = DIGIT_STRINGS[input % 10] + result
    input /= 10
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
