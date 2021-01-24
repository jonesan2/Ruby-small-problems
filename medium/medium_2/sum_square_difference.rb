def sum_square_difference(n)
  int_arr = []
  (1..n).each { |i| int_arr << i }
  int_arr.sum ** 2 - int_arr.map!{ |num| num ** 2}.sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150