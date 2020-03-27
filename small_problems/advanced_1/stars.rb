def stars(size)
  return 'Error' unless size >= 7 && size.odd?
  print_star(size)
end

def print_line(s_gap, m_gap)
  puts ' ' * s_gap + '*' + ' ' * m_gap + '*' + ' ' * m_gap + '*'
end

def print_star(size, start_gap = 0)
  mid_gap = (size - 3) / 2
  print_line(start_gap, mid_gap)
  start_gap += 1
  if mid_gap.zero?
    puts('*' * (start_gap * 2 + 1))
  else
    print_star(size - 2, start_gap)
  end
  start_gap -= 1
  print_line(start_gap, mid_gap)
end

stars(15)
