# Reverse It (Part 2)
#
# Alter a string so that words of 5 or more letters are reversed, written backwards.
#

def reverse_words(str)
  str.split.map { |word| word.length < 5 ? word : word.reverse }.join(' ')     
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
