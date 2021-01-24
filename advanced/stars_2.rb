def put_star?(size, row_idx, col_idx)
  (row_idx == size / 2) ||
    (col_idx == size / 2) ||
    (row_idx == col_idx) ||
    (row_idx + col_idx == size - 1)
end

def stars(size)
  return 'Error' unless size >= 7 && size.odd?
  display = Array.new(size)
  display.map! { |_| Array.new(size, ' ') }
  (0...size).each do |row_idx|
    (0...size).each do |col_idx|
      display[row_idx][col_idx] = '*' if put_star?(size, row_idx, col_idx)
    end
  end
  display.each { |row| puts row.join }
end

stars(7)
