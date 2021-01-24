class Array
  def my_reduce(starting_value = nil)
    counter = 0
    
    if starting_value == nil
      result = self.first
      counter = 1
    else
      result = starting_value
    end
    
    while counter < self.size
      result = yield(result, self[counter]) 
      counter += 1
    end
    
    result
  end
end

array = [1, 2, 3, 4, 5]

p array.my_reduce { |acc, num| acc + num }                    # => 15
p array.my_reduce(10) { |acc, num| acc + num }                # => 25
# p array.my_reduce { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p ['a', 'b', 'c'].my_reduce { |acc, value| acc += value }     # => 'abc'
p [[1, 2], ['a', 'b']].my_reduce { |acc, value| acc + value } # => [1, 2, 'a', 'b']