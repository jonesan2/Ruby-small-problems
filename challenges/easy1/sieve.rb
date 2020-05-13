# Sieve of Eratosthenes: finds all primes up to n
class Sieve
  def initialize(n)
    raise ArgumentError, 'n must be an integer greater than 1' unless valid?(n)

    @is_prime = Array.new(n + 1, true) # each array index represents a number
    @is_prime[0] = @is_prime[1] = false

    cur_prime = 2
    loop do
      # set multiples of current prime to false
      ((cur_prime * 2)..n).step(cur_prime) { |idx| @is_prime[idx] = false }

      # find next prime; break if none
      cur_prime = ((cur_prime + 1)..n).find { |idx| @is_prime[idx] }
      break unless cur_prime
    end
  end

  def primes
    @is_prime.each_index.select { |idx| @is_prime[idx] }
  end

  private

  def valid?(n)
    n.is_a?(Integer) && n > 1
  end
end
