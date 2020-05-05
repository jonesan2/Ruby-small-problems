def step(start_value, end_value, jump)
  current_value = start_value
  while current_value <= end_value do
    yield(current_value)
    current_value += jump
  end
  current_value
end

x = Time.now
step(1, 10, 3) { |value| puts "value = #{value}" }
p Time.now - x