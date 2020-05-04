def missing(arr)
  result = []
  (arr.first...arr.last).each { |num| result << num if !arr.include?(num) }
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []