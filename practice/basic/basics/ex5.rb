nums = [5, 6, 7, 8]

nums.each do |n|
  ans = 1
  n.downto(1) { |k| ans *= k }
  puts "#{n}! = #{ans}"
end
