# A better solution from a fellow student, maruko, who is 15 days ahead of me:
#
# def sum_of_sums(array)
#   array.map.with_index { |x, idx| array[0..idx] }.flatten.sum
# end
#

def sum_of_sums(arr)
  arr.reverse.each_with_index.reduce(0) { |tot, (el, i)| tot + el * (i + 1) }
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
