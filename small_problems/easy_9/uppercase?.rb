# The provided solution is much simpler:
#   string == string.upcase

def uppercase?(str)
  str.chars.reduce(true) do |final, char|
    final && char !~ /[a-z]/
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
