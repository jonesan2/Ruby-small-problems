# The objective is to return all pairs of integers from a given 
# collection of integers that have a difference of 2.
#
# The result should be sorted in ascending order.
#
# The input will consist of unique values. 
# The order of the integers in the input collection should not matter.

def difference_of_2(arr)
  output_arr = []
  arr.each do |elem|
    output_arr << [elem, elem + 2] if arr.include?(elem + 2)
  end
  output_arr.uniq.sort
end

p difference_of_2([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p difference_of_2([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_2([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_2([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]