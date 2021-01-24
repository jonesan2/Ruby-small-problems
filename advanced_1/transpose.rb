def transpose(matrix)
  size = matrix.size
  new_matrix = Array.new(size)
  new_matrix.map! { |_| Array.new(size, 0) }
  (0...matrix.size).each do |row_idx|
    (0...matrix.size).each do |col_idx|
      new_matrix[row_idx][col_idx] = matrix[col_idx][row_idx]
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
