class Luhn
  def initialize(int)
    return ArgumentError unless int.is_a?(Integer)
    @num = int
  end

  def addends
    @num.to_s.reverse.each_char.with_object([]) do |digit, obj|
      obj << (obj.size.odd? ? luhn_2(digit.to_i) : digit.to_i)
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(int)
    sum = new(int * 10).checksum
    int * 10 + (10 - sum % 10) % 10
  end

  private

  def luhn_2(int)
    int * 2 > 9 ? int * 2 - 9 : int * 2
  end
end
