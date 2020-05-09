# capability to convert trinary to decimal
class Trinary
  def initialize(str)
    # validate trinary number; set to 0 if invalid
    @trinary = str =~ /[^0-2]/ ? '0' : str
  end

  def to_decimal
    n = @trinary.length - 1
    (0..n).reduce(0) { |acc, elem| acc + @trinary.reverse[elem].to_i * 3**elem }
  end
end
