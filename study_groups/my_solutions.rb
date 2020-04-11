def difference_of_2(arr)
  output_arr = []
  arr.each do |elem|
    output_arr << [elem, elem + 2] if arr.include?(elem + 2)
  end
  output_arr.uniq.sort
end

def array_diff(a, b)
  output_arr = []
  a.each do |a_num|
    output_arr << a_num if !b.include?(a_num)
  end
  output_arr
end
