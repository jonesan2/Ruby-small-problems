# rubocop gives an error on line 8:
#  "Omit parentheses for ternary conditions."
#  The code fails if the parentheses are removed, but rubocop is happy.

def merge(array1, array2)
  a1 = array1.map { |x| x }
  a2 = array2.map { |x| x }
  result = []
  loop do
    break if a1.empty? || a2.empty?
    result << (a1.first < a2.first ? a1.shift : a2.shift)
  end
  (result << a1 << a2).flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
