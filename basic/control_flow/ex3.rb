
puts "Enter number: "
num = gets.chomp
num = num.to_i
output = case
  when (num >= 0) && (num <= 50)
    "between 0 and 50"
  when (num >= 51) && (num <= 100)
    "between 51 and 100"
  when num > 100
    "above 100"
  else
    "below zero"
end

puts "Your number is #{output}."
