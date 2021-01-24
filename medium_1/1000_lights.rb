def thousand_lights(n)
  n = n.to_s
  return 'Error' if n !~ /^[1-9][0-9]*$/ 
  n = n.to_i
  light_array = []
  n.times { |m| light_array << false }
  (1..n).each do |x|
    light_array.each_with_index do |switch, idx| 
      light_array[idx] = (idx + 1) % x == 0 ? !switch : switch
    end
  end
  switch_number_array = []
  n.times { |k| switch_number_array[k] = k + 1 }
  switches_on_array = []
  light_array.each_with_index do |light, idx|
    switches_on_array << switch_number_array[idx] if light
  end
  switches_on_array
end

p thousand_lights(5)
p thousand_lights(10)
p thousand_lights(1000)
