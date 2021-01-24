# You don't need to use #to_a in this solution.
# Calling #map on a Range automatically creates an array.

def sequence(count, first)
  (1..count).to_a.map { |elem| elem * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []