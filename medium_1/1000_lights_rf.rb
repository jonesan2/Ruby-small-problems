def verify_input(n)
  n = n.to_s
  return nil if n !~ /^[1-9][0-9]*$/
  n.to_i
end

def build_light_array(n)
  light_array = []
  n.times { |_| light_array << false }
  light_array
end

def flip_switches!(lights)
  (1..lights.size).each do |x|
    lights.each_with_index do |switch, idx|
      lights[idx] = ((idx + 1) % x).zero? ? !switch : switch
    end
  end
end

def int_array_to_string!(arr)
  arr[-1] = 'and ' + arr[-1].to_s if arr.size > 1
  arr.map!(&:to_s).join(', ')
end

def build_report(lights)
  switches_on_array = []
  switches_off_array = []
  lights.each_with_index do |light, idx|
    light ? switches_on_array << idx + 1 : switches_off_array << idx + 1
  end
  off_string = int_array_to_string!(switches_off_array)
  on_string = int_array_to_string!(switches_on_array)
  "Lights #{off_string} are now off; #{on_string} are on."
end

def thousand_lights(n)
  n = verify_input(n)
  return 'Error' unless n

  light_array = build_light_array(n)
  flip_switches!(light_array)
  build_report(light_array)
end

p thousand_lights(5)
p thousand_lights(10)
