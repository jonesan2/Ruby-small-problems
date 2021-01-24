def fibonacci(index)
  acc1 = 1
  acc2 = 1
  n = 3
  if index == 1 || index == 2 then return 1
  else
    loop do
      acc1, acc2 = acc2, acc1 + acc2
      n += 1
      break if n > index
    end 
  end
  acc2
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
