def fibonacci(index)
  index >= 3 ? fibonacci(index - 1) + fibonacci(index - 2) : 1
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765