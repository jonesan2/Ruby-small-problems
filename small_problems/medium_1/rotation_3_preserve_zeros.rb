def max_rotation(int)
  digit_arr = int.to_s.chars
  digit_arr.size.downto(2) do |n|
    digit_arr = rotate_rightmost_elems(digit_arr, n)
  end
  digit_arr.join.to_i
end

def rotate_rightmost_elems(arr, n)
  arr << arr.slice!(-n)
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(700003) == 3070
