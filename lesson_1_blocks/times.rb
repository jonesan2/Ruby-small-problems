class Integer
  def my_times
    i = 0
    loop do
      yield(i)
      i += 1
      break if i >= self
    end
    self
  end
end

var = 5.my_times do |num|
  puts num
end
puts var