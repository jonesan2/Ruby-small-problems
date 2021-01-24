def rotate_any(matrix, degrees)
  return 'Error' unless degrees.to_s =~ /90|180|270|360/
  new_matrix = rotate90(matrix)
  new_matrix = rotate90(new_matrix) if degrees >= 180
  new_matrix = rotate90(new_matrix) if degrees >= 270
  new_matrix = rotate90(new_matrix) if degrees == 360
  new_matrix
end

def rotate90(matrix)
  num_rows = matrix.size
  num_cols = matrix[0].size
  new_matrix = Array.new(num_cols)
  new_matrix.map! { |_| Array.new(num_rows, 0) }
  (0...num_rows).each do |row_idx|
    (0...num_cols).each do |col_idx|
      new_matrix[col_idx][num_rows - 1 - row_idx] = matrix[row_idx][col_idx]
    end
  end
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate_any(matrix2, 90)
p rotate_any(matrix2, 180)
p rotate_any(matrix2, 270)
p rotate_any(matrix2, 360)
