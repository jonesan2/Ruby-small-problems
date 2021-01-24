include Math

def put_mark?(size, row_idx, col_idx)
  y_value = (size / 2 - row_idx)
  x_value = col_idx * PI / size.to_f
  y_value == ((size / 2) * Math.sin(x_value)).floor
end

def sine(size)
  return 'Error' unless size >= 7 && size.odd?
  length = size * 3
  display = Array.new(size)
  display.map! { |_| Array.new(length, ' ') }
  (0...size).each do |row_idx|
    (0...length).each do |col_idx|
      display[row_idx][col_idx] = '*' if put_mark?(size, row_idx, col_idx)
    end
  end
  display.each { |row| puts row.join }
end

sine(7)
sine(13)
sine(19)
