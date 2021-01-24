USERNAME = "jonesan2"
PWD = "cheese"
loop do
  puts ">> Please enter your username: "
  input1 = gets.chomp
  puts ">> Please enter your password: "
  input2 = gets.chomp
  break if input1 == USERNAME && input2 == PWD 
  puts ">> Authorization failed!"
end

puts "Welcome!"