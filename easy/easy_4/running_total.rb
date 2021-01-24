# This one made me feel really stupid.
# You can solve it with Array#map, and I didn't think to use it.
# There's also a little trick with using the return value of the += operation.
# I think I should memorize this solution and study it so that I don't forget
# to use it again, I am so mad that I didn't think of it.
#
# The better solution:
#
# def running_total(num_list)
#   sum = 0
#   num_list.map { |x| sum += x }
# end

def running_total(num_list)
  totals = []
  (1..num_list.size).each { |i| totals.push(num_list.slice(0..(i - 1)).sum) }
  totals
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
