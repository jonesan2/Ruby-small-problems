def triangle(int)
  (1..int).each { |i| puts (' ' * (i - 1) + '*' * (int * 1 - i)) }
end

puts 'Enter your integer, if you dare: '
value = gets.chomp.to_i
triangle(value)
