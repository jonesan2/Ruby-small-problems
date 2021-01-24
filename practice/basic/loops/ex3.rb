puts "Input starting number: "
start = gets.chomp
def countdown(num)
  puts num unless num <= 0
  countdown(num-1) unless num <= 0
end
countdown(start.to_i) 
