def triangle(int)
  (1..int).each { |i| puts (' ' * (int - i) + '*' * i) }
end

puts 'Enter your integer, if you dare: '
value = gets.chomp.to_i
triangle(value)
