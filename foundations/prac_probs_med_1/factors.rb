def factors(number)
  factors = [] 
  (1..number).each do |divisor|
    if number % divisor == 0
      factors << number / divisor
    end
  end
#  begin
#    factors << number / divisor if number % divisor == 0
#    divisor -= 1
#  end until divisor == 0
  factors
end

p factors(12)
p factors(0)
p factors(-5)
