class Array
  def my_select
    counter = 0
    new_array = []
    
    while counter < self.size
      current_element = self[counter]
      new_array << current_element if yield(current_element)
      counter += 1
    end
    
    new_array
  end
end

array = [1, 2, 3, 4, 5]
p array.my_select { |num| num.odd? }       # => [1, 3, 5]
puts
p array.my_select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
puts
p array.my_select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true 