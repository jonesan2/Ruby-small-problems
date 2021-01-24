include Math

def put_mark?(size, row_idx, col_idx)
  radius = size / 2
  x_dist = (row_idx - radius).abs
  y_dist = (col_idx - radius).abs
  dist = Math.hypot(x_dist, y_dist)
  dist.floor == radius
end

def circle(size)
  return 'Error' unless size >= 7 && size.odd?
  display = Array.new(size)
  display.map! { |_| Array.new(size, ' ') }
  (0...size).each do |row_idx|
    (0...size).each do |col_idx|
      display[row_idx][col_idx] = '*' if put_mark?(size, row_idx, col_idx)
    end
  end
  display.each { |row| puts row.join }
end

circle(7)
circle(13)
circle(19)
