factorial = Enumerator.new do |y|
      y << 1
      idx = accumulator = 1
      loop do
        accumulator = idx * accumulator
        y << accumulator
        idx = idx + 1
      end
    end

i = 0
loop do
  p factorial.next
  i += 1
  break if i >= 7
end

factorial.rewind

factorial.each_with_index do |n, idx|
  break if idx >= 7
  p n
end

p factorial.take(7)