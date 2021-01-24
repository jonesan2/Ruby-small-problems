def bubble_sort!(arr)
  swap_occurred = true
  while swap_occurred
    swap_occurred = false
    (0...arr.size - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap_occurred = true
      end
    end
  end
  arr
end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
