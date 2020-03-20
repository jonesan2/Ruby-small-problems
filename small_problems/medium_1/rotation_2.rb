def rotate_rightmost_digits(int, num_digits)
  digit_arr = int.to_s.chars
  right_side = rotate_array(digit_arr[(-1 * num_digits)..-1])
  ((digit_arr)[0...(digit_arr.size - num_digits)] + right_side).join.to_i
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917