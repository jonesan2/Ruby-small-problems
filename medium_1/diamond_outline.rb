def diamonds(n)
  diamond_array = []
  (1..n).each do |k|
    next if k.even?
    if k == 1
      diamond_array << ' ' * (n / 2) + '*' * k
      next
    end
    diamond_array << ' ' * ((n + 1 - k) / 2) + '*' + ' ' * (k - 2) + '*'
  end
  print_diamond(diamond_array, 0)
end

def print_diamond(arr, i)
  puts arr[i]
  return if (i + 1) >= arr.size
  print_diamond(arr, i + 1)
  puts arr[i]
end

diamonds(19)
