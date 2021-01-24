# Don't forget the 'then' in case statements
# Note that Array#delete mutates the caller, but String#delete does not

DIGITS = { '0' => 0,
           '1' => 1,
           '2' => 2,
           '3' => 3,
           '4' => 4,
           '5' => 5,
           '6' => 6,
           '7' => 7,
           '8' => 8,
           '9' => 9 }.freeze

def string_to_integer(input)
  output = input.chars.map { |c| DIGITS[c] }
  output.reduce(0) { |value, num| 10 * value + num }
end

def string_to_signed_integer(input)
  sign = input[0] == '-' ? -1 : 1
  sign * string_to_integer(input.delete('+-'))
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
