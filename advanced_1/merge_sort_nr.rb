def merge_sort(arr)
  new_a = []
  temp_a = []
  arr.each { |x| new_a.unshift([x]) }
  loop do
    merge_one_level(new_a, temp_a)
    new_a = temp_a
    temp_a = []
    break if new_a.size == 1
  end
  new_a.flatten
end

def merge_one_level(new_a, temp_a)
  loop do
    if new_a.size > 1 then temp_a.unshift(merge(new_a.pop, new_a.pop))
    elsif new_a.size == 1 then temp_a.unshift(new_a.pop)
    else break
    end
  end
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
