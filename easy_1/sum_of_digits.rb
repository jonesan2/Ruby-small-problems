# Sum of Digits
#
# I got the suggested solution on the first try.
#
# Data Structures: Input Integer, Output Integer
#   intermediate, String
#
# Algorithm:
#   -change Integer to String
#   -split String into chars
#   -change chars into Integers
#   -sum the Integers

def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
