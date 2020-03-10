def halvsies(arr)
  middle = arr.size.even? ? arr.size / 2 : arr.size / 2 + 1
  arr1, arr2 = arr.slice(0, middle), arr.slice(middle, arr.size - middle)
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
