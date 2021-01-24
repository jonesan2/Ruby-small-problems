# The Enumerable#each_with_object method obviates the need to initialize a 
# result variable before the each statement and return it afterwards.
# Compare this solution to running_total.rb
# Also take note that Array#slice accepts 3 possible argument chains:
#   1) one integer index, returning the item at that index
#   2) two integers, the starting index of the return substring, and
#      the LENGTH of the substring (NOT the second index!)
#   3) one RANGE that covers the range of desired indeces

def running_total(num_list)
  (0..(num_list.size - 1)).each_with_object([]) do |i, a| 
    a << num_list.slice(0..i).reduce(&:+) 
  end
end

p running_total([2, 5, 13])
