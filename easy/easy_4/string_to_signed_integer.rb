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

def string_to_signed_integer(input)
  sign = (input[0] == '-') ? -1 : 1
  digits = input.delete("+-").chars.map { |char| DIGITS[char] }
  sign * digits.reduce(0) { |value, digit| 10 * value + digit }
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
