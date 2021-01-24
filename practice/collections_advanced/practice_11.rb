arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

result = arr.map { |inner_a| inner_a.select { |num| num % 3 == 0 } }
p result

