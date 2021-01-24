# What's My Bonus?
#
# UP:
#   -take 2 arguments: positive integer, boolean
#   -if true, the bonus is half the salary.
#   -if false, there is no bonus.
#

def calculate_bonus(int, bool)
  bool ? int / 2 : 0 
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
