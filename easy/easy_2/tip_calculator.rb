# Things I learned:
#   1) It is better to do gets.chomp and then convert the format on the next
#      line than it is to do something like gets.chomp.to_f
#   2) The format method belongs to the Kernel.

puts 'Please enter amount of bill:'
amount = gets.chomp
amount = amount.to_f

puts 'Please enter tip % (for example, 15, 20, or 25):'
rate = gets.chomp
rate = rate.to_f

tip = amount * rate / 100
total = amount + tip

puts "Your tip is: $#{format('%.2f', tip)}"
puts "Your total is: $#{format('%.2f', total)}"
