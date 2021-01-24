# Things I learned
#   1) The String#delete method takes arguments that sort of look like regex
#   2) The String#gsub method 

def palindrome?(obj)
  obj == obj.reverse
end

def real_palindrome?(str)
  new_str = str.downcase.chars.filter { |char| /[0-9a-z]/.match(char) }.join
  palindrome?(new_str)
end

def real_palindrome_2?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def real_palindrome_3?(string)
  string = string.downcase.gsub(/[^0-9a-z]/, '')
  palindrome?(string)
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1, 2, 3, 2, 1]) == true
puts palindrome?([1, 2, 3, 4, 1]) == false

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
