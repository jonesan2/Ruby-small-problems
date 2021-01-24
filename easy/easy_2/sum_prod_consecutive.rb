SYMBOLS = { 's' => 'sum',
            'p' => 'product' }.freeze

top = 0
choice = ''
loop do
  puts 'Please enter an integer greater than 0.'
  top = gets.chomp
  top = top.to_i
  top <= 0 ? puts('Invalid entry') : break
end

loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp
  break unless choice.casecmp('s') != 0 && choice.casecmp('p') != 0
  puts('Invalid entry')
end

if choice == 's'
  ans = (1..top).sum
elsif choice == 'p'
  ans = (1..top).inject(:*)
else
  puts 'That is not a valid option.'
  return
end

puts "The #{SYMBOLS[choice]} of the integers between 1 and #{top} is #{ans}"
