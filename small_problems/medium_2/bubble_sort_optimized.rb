def bubble_sort!(arr)
  swap_index = -1
  last_index = arr.size - 1
  loop do
    (0...last_index).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap_index = i
      end
    end
    break if swap_index == -1
    last_index = swap_index
    swap_index = -1
  end
  arr
end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
