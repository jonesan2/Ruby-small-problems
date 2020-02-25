int1 = nil
int2 = nil

def read_int
  puts ">> Please enter a positive or negative integer: "
  int = gets.chomp.to_i
  return int if int != 0
  puts "Invalid input. Only non-zero integers are allowed."
end

loop do
  int1 = read_int
  int2 = read_int
  break if (int1 < 0) ^ (int2 < 0)
  puts "Sorry. One integer must be positive, one must be negative."
end

puts "#{int1} + #{int2} = #{int1 + int2}"
