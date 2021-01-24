def running_total(num_list)
  result = []
  (1..num_list.size).each { |x| result << num_list.slice(0..x - 1).inject(&:+) }
  result
end

p running_total([2, 5, 13])
