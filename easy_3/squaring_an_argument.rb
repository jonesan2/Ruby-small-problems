def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power(num, exp)
  exp = exp.to_i
  return 1 if exp.zero?
  count = exp.abs
  current_answer = 1
  loop do
    current_answer = multiply(num, current_answer)
    count -= 1
    break if count.zero?
  end
  exp > 0 ? current_answer : 1 / current_answer
end

puts square(5) == 25
puts square(-8) == 64
puts power(2, 3) == 8
puts power(3, -2) == 1 / 9
