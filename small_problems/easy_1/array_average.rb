# Array Average
#
# Things I learned:
#   1) You can use array.reduce(:+) where :+ is a symbol that creates
#   a sum of all values in the array. Reduce can accept a block or a symbol
#   as its argument.
#   2) You can make / return a float by adding .to_f to the numerator.
#
# Return the avverage of all numbers in the array.
# The numbers will all be positive integers.
# The array will never be empty.
#
# Data Structures: Input array, return Integer
#
# Algorithm:  Reduce array using sum, divide by length

def average(input)
  input.sum / input.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([1, 5, 87, 45, 8, 8]).class
puts average([9, 47, 23, 95, 16, 52]) == 40
