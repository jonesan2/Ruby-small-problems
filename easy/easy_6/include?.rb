# You can use !! to turn the return value of Array#find into a boolean,
# BUT if the object that was searched and found is >false< or >nil<, then 
# the !! will return false when it should return true.
# Array#find returns nil if no object was found.
# The way around this is to use __________ Array#find_index ________ instead!

def include?(arr, search)
  !arr.count(search).zero?
end

p include?([1,2,3,4,5], 8) == false
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([false], false) == true
p include?([], nil) == false
