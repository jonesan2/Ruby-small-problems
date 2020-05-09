# capability to convert octal to decimal
class Octal
  def initialize(str)
    # validate octal number; set to 0 if invalid
    @octal = str =~ /[^0-7]/ ? '0' : str
  end

  def to_decimal
    max = @octal.length - 1
    (0..max).reduce(0) { |acc, elem| acc + @octal.reverse[elem].to_i * 8**elem }
  end
end
