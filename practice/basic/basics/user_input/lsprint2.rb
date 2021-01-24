loop do
  
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit): "
  input = gets.chomp
  break if input.upcase == "Q"
  
  num_lines = input.to_i
  if num_lines < 3 
    puts "That's not enough lines."
    next
  end

  while num_lines > 0
    puts "Launch School is the best!"
    num_lines -= 1
  end
end



 