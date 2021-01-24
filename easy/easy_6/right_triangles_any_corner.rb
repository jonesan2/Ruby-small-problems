def triangle(int, corner)
  case corner
  when 1
    (1..int).each { |i| puts ' ' * (i - 1) + '*' * (int + 1 - i) }
  when 2
    (1..int).each { |i| puts '*' * (int + 1 - i) + ' ' * (i - 1) }
  when 3
    (1..int).each { |i| puts '*' * i + ' ' * (int - 1) }
  when 4
    (1..int).each { |i| puts ' ' * (int - i) + '*' * i }
  else
    puts 'Error: Invalid entry for corner'
  end
end

puts 'Enter your integer, if you dare: '
value = gets.chomp.to_i
puts 'Choose your corner (1, 2, 3, or 4): '
corner = gets.chomp.to_i
triangle(value, corner)
