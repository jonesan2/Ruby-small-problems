# How Many?
#
# Things to learn:
#   1) Array#count takes a value as argument and returns the # of occurrences
#   2) It's ok to use a string as a hash key if it helps simplify your code
#
# Write a method that counts the number of occurrences of each element in a
# given array.
#
# Understand the Problem:
# - create a new title for each new element
# - increment the counter for that element upon each occurrence
# Examples:
#   For the provided array, print:
#   car => 4
#   truck => 3
#   SUV => 1
#   motorcycle => 2
#
# Data Structures: 
#   The input is an array
#   Use a hash for the results
# Algorithm:
#   ID unique values in input array
#   Create a hash with keys equal to the unique values
#   Give each key a default starting value of 0
#   For each array element, increment the hash value by one
#   Print the key and value for each hash element

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(input)
  result = {}
  input_lowercase = input.map(&:downcase)
  input_lowercase.uniq.each { |key| result[key.to_sym] = 0 }
  input_lowercase.each { |key| result[key.to_sym] += 1 }
  result.each { |k, v| puts "#{k} => #{v}" }
  result
end

count_occurrences(vehicles)
