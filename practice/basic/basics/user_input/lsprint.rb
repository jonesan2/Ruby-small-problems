num_lines = nil

loop do
  puts ">> How many output lines do you want? Enter a number >= 3: "
  num_lines = gets.chomp.to_i
  num_lines < 3 ? (puts "That's not enough lines.") : break
end

while num_lines > 0
  puts "Launch School is the best!"
  num_lines -= 1
end



 