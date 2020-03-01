# Things I learned:
#   1) Kernal#eval will allow you to insert strings into an operation
#      but it is a Security Risk.
#   2) My favorite solution was to put the ints in an array and the
#      operators in a symbol array, and then use reduce(&operator).

OPERATIONS = %w(+ - * / % **).freeze

def prompt(message)
  puts("=> #{message}")
end

prompt('Enter the first number:')
int1 = gets.chomp.to_i
prompt('Enter the second number:')
int2 = gets.chomp.to_i

OPERATIONS.each do |op|
  prompt("#{int1} #{op} #{int2} = #{eval("#{int1} #{op} #{int2}")}")
end
