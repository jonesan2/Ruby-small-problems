require 'pry'
DIGITS_HASH = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3,
                'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
                'eight' => 8, 'nine' => 9 }.freeze

# catch times and divded by
# divided by creates a four term operation -- allow for that
# ...easiest way is to delete the word 'by'
# after deleting 'by', just add times and divded to the if statements

def convert(input)
  input == input.to_i.to_s ? input.to_i : DIGITS_HASH[input]
end

def three_term_math(english)
  terms = english.split
  operator = terms[1]
  num1 = convert(terms[0])
  num2 = convert(terms[2])
  if operator == 'plus'
    num1 + num2
  elsif operator == 'minus'
    num1 - num2
  elsif operator == 'times'
    num1 * num2
  elsif operator == 'divided'
    num1 / num2
  end
end

def computer(english)
  new_english = english.delete('by')
  terms = new_english.split
  loop do
    times_index = terms.find_index('times')
    break unless times_index
    math_string = terms.slice!(times_index - 1, 3).join(' ')
    result = three_term_math(math_string)
    terms.insert(times_index - 1, result)
  end
  loop do
    div_index = terms.find_index('divided')
    break unless div_index
    math_string = terms.slice!(div_index - 1, 3).join(' ')
    result = three_term_math(math_string)
    terms.insert(div_index - 1, result)
  end
  loop do
    break if terms.length == 1
    first_op = terms[0..2].join(' ')
    result = three_term_math(first_op)
    3.times { |_| terms.shift }
    terms.unshift(result)
  end
  terms.first
end

p computer('two plus two divided by six times three divided by nine')
p computer('two plus two minus three plus seven minus eight')
p computer('seven minus six')
p computer('zero plus eight')
p computer('three minus one plus five minus 4 plus six plus 10 minus 4')
p computer('eight times four plus six divided by two minus two')
p computer('one plus four times two minus two')
p computer('nine divided by three times six')
