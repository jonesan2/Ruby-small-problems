def print_line(size, row)
  print ' ' * row
  mid_gap = (size - 3) / 2 - row
  2.times { |_| print '*' + ' ' * mid_gap }
  puts '*'
end

def stars(size)
  return 'Error' unless size >= 7 && size.odd?
  (0...size / 2).each { |row| print_line(size, row) }
  puts '*' * size
  (size / 2 - 1).downto(0) { |row| print_line(size, row) }
end

stars(11)
