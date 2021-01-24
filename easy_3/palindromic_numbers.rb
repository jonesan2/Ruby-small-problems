def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

puts palindromic_number?(345_43) == true
puts palindromic_number?(123_210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
