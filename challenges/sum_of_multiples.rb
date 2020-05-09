# finds the sum of all multiples <= n of a provided set of numbers
class SumOfMultiples
  DEFAULT_SET = [3, 5].freeze

  def initialize(*args)
    @set = args.empty? ? DEFAULT_SET : args.flatten
  end

  def to(n)
    @set.map { |num| (num...n).step(num).to_a }.flatten.uniq.sum
  end

  def self.to(n)
    new(DEFAULT_SET).to(n)
  end
end
