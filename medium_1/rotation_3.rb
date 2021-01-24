def max_rotation(int)
  result = int
  (1..int.to_s.size).reverse_each do |n|
    result = rotate_rightmost_digits(result, n)
  end
  result
end

def rotate_rightmost_digits(num, n)
  num_arr = num.to_s.chars
  num_arr[-n..-1] = rotate_array(num_arr[-n..-1])
  num_arr.join.to_i
end

def rotate_array(arr)
  arr[-1], arr[0..(arr.size - 2)] = arr[0], arr[-(arr.size - 1)..-1]
  arr
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
