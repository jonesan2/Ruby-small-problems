# It looks to be convention to return the "good" value inside of a loop,
# while placing the error value outside of it...the opposite of what I have
# done in my 'featured' method.

def find_top_limit
  num = 9_876_543_210
  num = num - num % 7
  num -= 7 if num.even?
  loop do
    test_arr = num.to_s.chars
    break if test_arr == test_arr.uniq
    num -= 14
  end
  num
end

def featured(num)
  top_limit = find_top_limit
  search = num + 7 - num % 7
  search += 7 if search.even? 
  loop do  
    test_arr = search.to_s.chars
    break if test_arr == test_arr.uniq
    search += 14
    if search > top_limit 
      return "There is no possible number that fulfills those requirements"
    end
  end
  search
end

p "top limit is #{find_top_limit}"
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)