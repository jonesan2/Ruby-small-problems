def fibonacci(index)
  acc1, acc2 = [1, 1] 
  3.upto(index) do |n|
    acc1, acc2 = acc2, acc1 + acc2
  end 
  acc2
end

p fibonacci(14)
p fibonacci(15)
p fibonacci(16)
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(100_001)