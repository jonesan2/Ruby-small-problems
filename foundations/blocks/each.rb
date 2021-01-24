class Array
  def my_each
    counter = 0
    
    while counter < self.size do
      yield(self[counter])
      counter += 1
    end
    
    self
  end
end

var = [1, 2, 3, 4, 5].my_each do |num|
  puts num
end
p var