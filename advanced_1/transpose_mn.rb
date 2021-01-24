def transpose(matrix)
  num_rows = matrix.size
  num_cols = matrix[0].size
  new_matrix = Array.new(num_cols)
  new_matrix.map! { |_| Array.new(num_rows, 0) }
  (0...num_rows).each do |row_idx|
    (0...num_cols).each do |col_idx|
      new_matrix[col_idx][row_idx] = matrix[row_idx][col_idx]
    end
  end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
    [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
