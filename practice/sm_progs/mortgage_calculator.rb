# Mortgage / Car Loan Calculator
#
# Three inputs: loan amount, APR, loan duration
# Two outputs: monthly interest rate, loan duration in months
#
# Data Structures:  floats
#
# Algorithm:
#   START
#   GET 3 inputs from user
#   validate each input
#   SET duration and interest rate
#   PRINT results

require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts "=> #{message}"
end

def get_float(input_type)
  prompt(MESSAGES[LANGUAGE][input_type])
  input = gets.chomp
  loop do
    break if /\d+/.match(input) && /^\d*\.?\d*$/.match(input)
    prompt(MESSAGES[LANGUAGE]['input_error'])
    prompt(MESSAGES[LANGUAGE][input_type])
    input = gets.chomp
  end
  input.to_f
end

prompt(MESSAGES[LANGUAGE]['welcome'])
loan_amount = get_float('loan_amount')
puts "Your loan amount is $#{loan_amount}"
apr_amount = get_float('apr_amount')
puts "Your APR is #{apr_amount}%"
loan_duration_years = get_float('loan_duration')
puts "Your loan duration is #{loan_duration_years} years."

monthly_rate = apr_amount / 100.0 / 12.0
loan_duration_months = loan_duration_years * 12.0
monthly_payment = loan_amount *
                  (monthly_rate / (1 -
                  (1 + monthly_rate)**(-1 * loan_duration_months)))
prompt(MESSAGES[LANGUAGE]['print_rate'])
prompt("$#{format('%02.2f', monthly_payment)}")
prompt(MESSAGES[LANGUAGE]['print_duration'])
prompt("#{loan_duration_months.to_i} months")
