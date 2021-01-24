def substring(str, front, back = nil)
  #return one char if back arg not specified
  #modify the back arg to be the final index if back is too large
  #return the substring
  
  return str[front] unless back 
  back = str.size - 1 if back > str.size - 1
  str[front..back] 
end

def all_substrings(str)
  substrings = []
  (0...str.size-1).each do |idx|
    (idx + 1...str.size).each { |idx2| substrings << str[idx..idx2] }
  end
  substrings
end

def all_palindromes(str)
  all_substrings(str).select { |substr| substr == substr.reverse }.uniq
end

def largest_palindrome(str)
  all_palindromes(str).reduce('') { |larg, pal| pal if pal.size > larg.size }
end

p largest_palindrome("ppop")
