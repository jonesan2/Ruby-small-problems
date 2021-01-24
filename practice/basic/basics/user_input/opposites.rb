int1 = nil
int2 = nil

loop do

  loop do
    puts ">> Please enter a positive or negative integer: "
    int1 = gets.chomp.to_i
    break if int1 != 0
    puts "Invalid input. Only non-zero integers are allowed."
  end
  
  loop do
    puts ">> Please enter a positive or negative integer: "
    int2 = gets.chomp.to_i
    break if int2 != 0
    puts "Invalid input. Only non-zero integers are allowed."
  end

  break if (int1 < 0) ^ (int2 < 0)
  puts "Sorry. One integer must be positive, one must be negative."

end

puts "#{int1} + #{int2} = #{int1 + int2}"
