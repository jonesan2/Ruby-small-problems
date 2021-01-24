a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

result = a.map do |inner_h| 
  inner_h.transform_values { |v| v + 1 }
end

p a
p result
