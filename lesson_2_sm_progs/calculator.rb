# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
#
# answer = Kernel.gets()
# Kernel.puts(answer)
#
# Things I learned:
#   1) A variable initialized inside of an if condition IS available outside
#   2) Be careful with String#to_i, because it will convert any string that
#      doesn't start with digits into 0, and will truncate any non-digit string
#      from the end of a string that begins with digits.
#   3) Don't append a String#to_i method to a gets.chomp method directly
#       (The video said it would explain why, but did not do so.)
#       I assume it is because if you do that, you cannot verify a valid input.
#       If the input was an invalid string, if you call String#to_i immediately
#       you won't be able to tell if the original input was, e.g.,
#       a string or 0.
#   4) Use a YAML file with all messages in it so that text can be in one
#       location. Then you can create different headings for different 
#       languages and users can select their language at the beginning.
#       See the "Calculator Bonus Features" assignment for details on how
#       to make this work.
#   5) Use Unicode(UTF-8) encoding for all characters. This includes program
#       files and auxillary files, like YAML files.
#

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['valid_name'])
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['first_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("The result is: #{result}")

  prompt(MESSAGES['another_calc'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
  
prompt(MESSAGES['goodbye'])
