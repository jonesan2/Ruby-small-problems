# You could also use the Enumerable#sort_by method, which simply looks to 
# the block for a sorting index. You cannot use Array#sort_by because it
# does not exist. The Array#sort_by! method is the only one available,
# which mutates the caller. 

NUMBER_WORDS = %w(zero, one, two, three, four, five, six, seven, eight, 
                  nine, ten, eleven, twelve, thirteen, fourteen, fifteen, 
                  sixteen, seventeen, eighteen, nineteen).freeze

def alphabetic_number_sort(num_array)
  num_array.sort { |a, b| NUMBER_WORDS[a] <=> NUMBER_WORDS[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

