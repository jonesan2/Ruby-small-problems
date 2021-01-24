# Stringy Strings
#
# Things learned:
#   1) Integer#times iterages from zero to int-1, not from 1 to int.
#
# For a given integer, return a string of alternating 1's and 0's that starts
# with 1 and has the length of the given integer.
#
# Further exploration: Make the string start with zero if an optional argument
# is set to zero (default value is 1).

def stringy(int, start = 1)
  result = ''
  int.times { |i| i.even? ? result << '1' : result << '0' }
  result = result.split('').map { |i| i == '0' ? '1' : '0' }.join if start == 0
  result
end

puts stringy(6,1) == '101010'
puts stringy(9,0) == '010101010'
puts stringy(4,0) == '0101'
puts stringy(7,-12) == '1010101'
