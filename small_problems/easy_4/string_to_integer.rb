# The method could be simpler if you feed from the LEFT side of the array
# and multiply the current reduction by 10 every time you add in a new 
# integer from the left side. Not an intuitive method for me, but simpler
# to code. Here is the provided solution:
#
# digits = string.chars.map { |char| DIGITS[char] }
#
# value = 0
# digits.each { |digit| value = 10 * value + digit }
# value
# 
DIGITS = { '0' => 0,
           '1' => 1,
           '2' => 2,
           '3' => 3,
           '4' => 4,
           '5' => 5,
           '6' => 6,
           '7' => 7,
           '8' => 8,
           '9' => 9 }.freeze

def string_to_integer(input)
  output = input.chars.map { |c| DIGITS[c] }
  (0..output.size - 1).reduce(0) { |acc, elem| acc + output.pop * 10**elem }
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
