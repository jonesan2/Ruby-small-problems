def is_prime?(int)
  # check if number is only div by 1 and itself
  # check edge cases
  return false if int == 1
  (2..(int - 1)).each do |num|
    return false if int % num == 0
  end
  true
end

def prime_array(arr)
  arr.select { |num| is_prime?(num) }
end

def num_primes(arr)
  prime_array(arr).length
end

p num_primes([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

=begin
p is_prime?(1)
p is_prime?(2)
p is_prime?(3)
p is_prime?(6)
p is_prime?(11)
=end
