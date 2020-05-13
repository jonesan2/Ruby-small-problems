class Integer
  def to_roman
    raise RuntimeError unless (1..3000).cover?(self)
    3.downto(0).each.with_object("") do |place, roman|
      roman << digit_to_roman(place, to_s.reverse[place].to_i)
    end
  end

  private

  def digit_to_roman(place, value)
    return '' unless value

    numerals = %w(I V X L C D M)
    latin = numerals[place * 2, 3]

    result = ""
    result << latin[0] if [4, 9].include?(value)
    result << latin[1] if (4..8).cover?(value)
    result << latin[2] if value.equal?(9)
    (value % 5).times { |_| result << latin[0] } unless value % 5 == 4
    result
  end
end
