def prompt(msg)
  puts "=> #{msg}"
end

def sum_or_product
  # input error handling for both inputs
  prompt("Enter an integer greater than zero")
  int = gets.chomp.to_i
  prompt("Do you want to compute the sum or product?")
  op = gets.chomp
  case op.downcase
  when 's' 
    sum = (1..int).reduce(&:+)
    prompt("The sum of the integers between 1 and #{int} is #{sum}.")
  when 'p'
    prod = (1..int).reduce(&:*)
    prompt("The product of the integers between 1 and #{int} is #{prod}.")
  else 
    prompt("Error in choice input")
  end
end

sum_or_product