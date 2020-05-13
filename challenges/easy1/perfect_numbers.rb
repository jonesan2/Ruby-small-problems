class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1

    inf = Float::INFINITY

    case factors(num).sum
    when (num + 1...inf) then 'abundant'
    when num then 'perfect'
    when 1...num then 'deficient'
    end
  end

  def self.factors(num)
    (1...num).select { |n| num % n == 0 }
  end
end
