class Person
  attr_accessor :first_name, :last_name
  
  def initialize(n)
    parse_full_name(n)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(n)
    parse_full_name(n)
  end
  
  private
  
  def parse_full_name(full_name)
    names = full_name.split(' ')
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end 
  
  def to_s
    name
  end
end