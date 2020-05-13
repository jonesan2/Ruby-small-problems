# Generate all subarray series of length n from an input string
class Series
  def initialize(str)
    @input = str.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @input.length || n < 1
    @input.each_cons(n).to_a
  end
end
