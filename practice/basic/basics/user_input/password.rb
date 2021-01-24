PWD = "cheese"
loop do
  puts ">> Please enter your password: "
  input = gets.chomp.to_s
  break if input == PWD
  puts ">> Invalid password!"
end

puts "Welcome!"