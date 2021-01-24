# fizzbuzz method accepts a start and ending number
# for each number, check if it is one of four types:
#     1) divisible by 3 and 5
#     2) div by 3
#     3) div by 5
#     4) everything else
# print a different output for each case

def fizzbuzz(start, finish)
  (start..finish).each do |n|
    output = ''
    output << 'Fizz' if (n % 3).zero?
    output << 'Buzz' if (n % 5).zero?
    puts output == '' ? n : output
  end
end

fizzbuzz(1, 15)
fizzbuzz(15, 1)
