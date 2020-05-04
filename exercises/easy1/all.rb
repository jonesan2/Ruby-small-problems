def all?(arr)
  arr.each { |item| return false unless yield(item) }
  true
end
