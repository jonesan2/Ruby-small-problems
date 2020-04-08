NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def random_math(length)
  return '' if length <= 0
  output = NUMBERS.sample
  (1..length).each { |_| output += " #{OPERATORS.sample} #{NUMBERS.sample}" }
  output
end

p random_math(8)