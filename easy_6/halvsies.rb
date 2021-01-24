def halvsies(arr)
  num_items = arr.size
  half_size = num_items / 2
  if num_items.even?
    arr1, arr2 = arr.slice(0, half_size), arr.slice(half_size, half_size)
  else
    arr1, arr2 = arr.slice(0, half_size + 1), arr.slice(half_size + 1, half_size)
  end
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
