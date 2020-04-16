class Cat
  @@total = 0
  
  attr_reader :name
  
  def initialize
    @@total += 1
  end

  def self.total
    p @@total
  end
  
  def self.generic_greeting
    puts "Hello from the Cat class!"
  end
  
  def personal_greeting
    puts "Hello from #{name}!"
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total