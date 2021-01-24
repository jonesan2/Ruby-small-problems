# Things to learn:
#   1) You can use the String#chars method rather than String#split('')
#   to get an array of characters in a string.
#   2) You can use .map(&:method) to map a method over a string rather than 
#   the long form .map { |x| x.method }
#
#   LS Solution: int.to_s.chars.map(&:to_i)

def digit_list(int)
  int.to_s.split('').map { |x| x.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
