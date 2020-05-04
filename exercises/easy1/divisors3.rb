def divisors(num)
  low_divs = 1.upto((num**0.5).floor).select { |i| (num % i).zero? }
  high_divs = low_divs.map { |j| num / j }
  (low_divs + high_divs).uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
x = Time.now
p divisors(98) == [1, 2, 7, 14, 49, 98]
p Time.now - x
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
x = Time.now
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
p Time.now - x