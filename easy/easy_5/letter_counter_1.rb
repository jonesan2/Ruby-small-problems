# When you create a new Hash, you can set a default value of 0 for any new 
# hash element by using Hash.new(default_value)
#
# You can also create default values by providing a block argument to Hash.new
# The block will assign the default value that can depend upon the key, or
# even upon other key-value pairs within that hash. The block accepts two
# arguments:  |hash, key|
#
# Better solution:
#
# def word_sizes(text)
#   result = Hash.new(0)
#   text.split(' ').each { |word| result[word.size] += 1 }
#   result
# end

def word_sizes(text)
  result = {}
  text.split(' ').each do |word| 
    result[word.size] = result.key?(word.size) ? result[word.size] + 1 : 1
  end 
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
