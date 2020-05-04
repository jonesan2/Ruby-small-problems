def none?(arr)
  arr.each { |item| return false if yield(item) }
  true
end
