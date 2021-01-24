def my_reverse!(arr)
  arr.each_with_index { |_, i| arr.unshift(arr.slice!(i)) }
end

list = [1,2,3,4]
result = my_reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
my_reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
my_reverse!(list) == ["abc"]
p list == ["abc"]

list = []
my_reverse!(list) == []
p list == []
