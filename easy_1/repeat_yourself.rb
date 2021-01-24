# Integer#times takes a block as its parameter

def repeat(str, num)
  num.times { |i| puts str }
end

repeat('Hello', 3) 
