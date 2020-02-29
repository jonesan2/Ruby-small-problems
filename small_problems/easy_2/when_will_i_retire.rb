current_year = Time.now.year

puts 'Please input your age:'
age = gets.chomp
age = age.to_i

puts 'At what age would you like to retire?'
retirement_age = gets.chomp
retirement_age = retirement_age.to_i

years_left = retirement_age - age
retirement_year = current_year + years_left

puts "The year is #{current_year}, and you will retire in #{retirement_year}."
puts "You only have #{years_left} years of work to go!"
