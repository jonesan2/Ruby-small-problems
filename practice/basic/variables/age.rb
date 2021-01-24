puts "How old are you? "
age = gets.chomp
years = [10, 20, 30, 40]
years.each do |y|
  puts "In #{y} years you will be:"
  puts age.to_i + y
end
