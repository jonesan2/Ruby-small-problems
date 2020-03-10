# Problem: Return the index of the first Fibonacci number with the number
# of digits provided in the argument.
#
# Edge cases: Argument 0, negative, non-integer, too large
# Assumptions: the argument is always greater than or equal to 2.
# Handle float: throw exception
# Handle non-number: throw exception
# Handle too large number: throw exception
#
# Data structures: array to store the Fibonacci sequence
#
# Algorithm:
# 0) Check for valid input and throw exceptions
# 1) Add Fib numbers to array one at a time
# 2) Check if the number is greater than 10**(n-1)
# 3) If so, return index plus one. 

def find_fibonacci_index_by_length(digits)
  return "Input is not an integer" if !(digits.is_a? Integer)
  return "Input is too large" if digits > 10000
  return "Input must be a positive integer" if digits < 1
  return 1 if digits == 1
  fib_array = [1, 1, 2, 3, 5, 8]
  loop do
    fib_array << fib_array[-1] + fib_array[-2]
    return fib_array.size if fib_array[-1] >= 10**(digits - 1)
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847 
