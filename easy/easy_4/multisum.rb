# Compute the sum of all the multiples of 3 and 5 that lie between 1 and num
def multisum(num)
  multiples_array = []
  (1..num).each { |i| multiples_array.push(i) if (i % 3 == 0) || (i % 5 == 0) }
  multiples_array.reduce(&:+)
end

p multisum(20)
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
