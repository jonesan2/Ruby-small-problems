class Vehicle
  @@number_of_vehicles = 0
  
  def self.print_num_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles."
  end
  
  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons} mpg of gas"
  end
  
  def speed_up
    self.speed = speed + 5
  end
  
  def brake
    self.speed = speed - 5
  end
  
  def shut_off
    self.speed = 0
  end
  
  def current_speed
    puts "Your current speed is #{self.speed}"
  end
end

module FourWheelDrive
  def built_ford_tough
    puts "This vehicle was built Ford tough."
  end
end

class MyTruck < Vehicle
  include FourWheelDrive
  
  attr_accessor :name
  ENGINE = "V6"
  
  def initialize(n)
    @name = n
  end
end

class MyCar < Vehicle
  ENGINE = "V4"
  attr_accessor :speed, :color, :model
  attr_reader :year
  
  def initialize(y, c, m)
    @year = y 
    @color = c
    @model = m
    @speed = 0
  end
  
  def to_s
    "This is a #{color} #{year} #{model}."
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  def age
    puts "The age of your vehicle is %0.2f years" % [calculate_age]
  end
  
  private
  
  def calculate_age
    (Time.now - Time.new(year))/(86400*365)
  end
end

kirby = MyCar.new(2015, 'black', 'honda crv')
kirby.speed_up
kirby.current_speed
kirby.spray_paint('blue')
puts kirby
Vehicle.print_num_of_vehicles
russ = MyTruck.new("Dodge Ram")
russ.built_ford_tough
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
kirby.age