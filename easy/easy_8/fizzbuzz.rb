# It's not a bad idea to use a separate method for only the case statement.
# That is one easy way to reduce complexity.

def fizzbuzz(start, finish)
  (start..finish).each do |num|
    three = (num % 3).zero?
    five = (num % 5).zero?
    puts case
         when three && five then 'FizzBuzz'
         when three && !five then 'Fizz'
         when !three && five then 'Buzz'
         else num
         end
  end
end

fizzbuzz(1, 15)
