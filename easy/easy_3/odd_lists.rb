# Things I learned:
#   1) Enumerator#with_index allows you to reference an array index in a block

def oddities(arr)
  new_arr = []
  (0..(arr.size - 1) / 2).each { |i| new_arr << arr[i * 2] }
  new_arr
end

def eventies(arr)
  new_arr = []
  (0..(arr.size / 2 - 1)).each { |i| new_arr << arr[i * 2 + 1] }
  new_arr
end

def oddities_2(arr)
  new_arr = []
  count = 0
  loop do
    break if count == arr.size
    new_arr << arr[count] if count.even?
    count += 1
  end
  new_arr
end

def oddities_3(arr)
  arr.filter.with_index { |_, i| i.even? }
end

puts oddities_3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities_3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities_3(['abc', 'def']) == ['abc']
puts oddities_3([123]) == [123]
puts oddities_3([]) == []
puts eventies([2, 3, 4, 5, 6]) == [3, 5]
puts eventies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts eventies(['abc', 'def']) == ['def']
puts eventies([123]) == []
puts eventies([]) == []
