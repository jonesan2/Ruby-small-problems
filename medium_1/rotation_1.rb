# The provided solution was much simpler:
#    arr[1..-1] + arr[0]

def rotate_array(arr)
  new_arr = []
  (1..arr.size - 1).each { |idx| new_arr << arr[idx] }
  new_arr << arr.first
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

p rotate_integer(525600) == 256005
p rotate_integer(5) == 5

p rotate_string('jello') == 'elloj'

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true