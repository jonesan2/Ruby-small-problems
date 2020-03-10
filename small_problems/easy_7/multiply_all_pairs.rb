# The Array#product method could be used to solve this.
# Array#product and Array#zip have similarities in terms of their 
# inputs and outputs, and can be used whenever two arrays are "multiplied"

def multiply_all_pairs(arr1, arr2)
  result_array = Array.new
  arr1.each do |num1|
    arr2.each { |num2| result_array << num1 * num2 }
  end
  result_array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
