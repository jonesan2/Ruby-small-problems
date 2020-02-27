# return true if the absolute value of an integer is odd
# % is a modulus operator in Ruby, rather than a remainder operator
# This means that its result will be positive, even if the initial number
# is negative. Ruby uses Integer#remainder, which returns a negative result
# if the intial number is negative. % only returns a negative result if
# the modulus argument is negative.

def is_odd(int)
  int.abs % 2 == 1
end

puts is_odd(2)
puts is_odd(5)
puts is_odd(-17)
puts is_odd(-8)
puts is_odd(0)
puts is_odd(7)
