class Pet
  @@number_of_pets = 0
  
  def initialize(type, name)
    @type = type
    @name = name
    @@number_of_pets += 1
  end
  
  def to_s
    "a #{type} named #{name}" 
  end
  
  def self.number_of_pets
    @@number_of_pets
  end
  
  private
  
  attr_reader :type, :name
end

class Owner
  attr_reader :name
  
  def initialize(name)
    @name = name
    @my_pets = []
  end
  
  def add_pet(pet)
    @my_pets << pet
  end
  
  def number_of_pets
    my_pets.length
  end
  
  def print_my_pets
    my_pets.each {|pet| puts pet}
  end
  
  private
  
  attr_reader :my_pets
end

class Shelter
  @@num_adopted_pets = 0
  
  def initialize
    @adopters = []
  end
  
  def adopt(owner, pet)
    owner.add_pet(pet)
    adopters << owner if !adopters.include?(owner)
    @@num_adopted_pets += 1
  end
  
  def print_adoptions
    adopters.each do |ad|
      puts "#{ad.name} has adopted the following pets:"
      ad.print_my_pets
      puts
    end
  end
  
  def print_unadopted_pets
    unadopted = Pet.number_of_pets - @@num_adopted_pets
    puts "The Animal shelter has #{unadopted} unadopted pets."
  end
  
  private
  
  attr_accessor :adopters
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
ginger       = Pet.new('dog', 'Ginger')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
ajones = Owner.new('A Jones')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(ajones, ginger)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.print_unadopted_pets
