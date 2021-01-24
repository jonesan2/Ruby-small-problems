# You have to create a method that takes a positive integer number and 
# returns the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1:

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

=begin
all_numbers: method that returns all possible permutations of digits, sorted
  --create an array to store all possible permutations, initially as strings
      size of array is n!
  --convert int to str
  --split str into chars
  --master iteration through range equaling length of int string
  --iterate through each digit. post it at the front of a string.
    --iterate through the remaining digits. post them at the front.
      --keep doing this until you run out of digits.
next_bigger_num: returns next number in the array after the one provided
=end

def all_numbers(int)
  digit_chars = int.to_s.chars  
  arr = digit_chars.permutation(digit_chars.size).to_a
  arr.map {|digit_set| digit_set.join.to_i}.uniq.sort
end

def next_bigger_num(int)
  arr = all_numbers(int)
  idx = arr.find_index(int) 
  idx == arr.size - 1 ? -1 : arr[idx + 1]
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(1721) == 2117