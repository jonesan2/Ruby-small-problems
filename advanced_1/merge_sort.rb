def merge_sort(arr)
  half = arr.size / 2
  arr = [arr.slice(0, half), arr.slice(half, half + 1)]
  arr[0] = merge_sort(arr[0]) if arr[0].size > 1
  arr[1] = merge_sort(arr[1]) if arr[1].size > 1
  merge(arr[0], arr[1])
end

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

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
