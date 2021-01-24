class Transform 
  def initialize(str)
    @this_string = str
  end
  
  def uppercase
    @this_string.upcase
  end
  
  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
