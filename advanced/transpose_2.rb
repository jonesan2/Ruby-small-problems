def transpose!(matrix)
  size = matrix.size
  (0...size).each do |r|
    (0...size).each do |c|
      matrix[r][c], matrix[c][r] = matrix[c][r], matrix[r][c] if r > c
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
