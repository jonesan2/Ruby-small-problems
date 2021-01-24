# Array#each_with_object and Array#inject are an interesting comparison
#     arr.each_with_object([]) { |item, result| .... }
#     arr.inject          ([]) { |result, item| .... }

def reverse(arr)
  arr.inject([]) { |result, item| result.unshift(item) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
