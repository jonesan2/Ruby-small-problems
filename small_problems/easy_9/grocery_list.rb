def buy_fruit(arr)
  result = []
  arr.each do |pair|
    pair[1].times { result << pair[0] }
  end
  result
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"] 
