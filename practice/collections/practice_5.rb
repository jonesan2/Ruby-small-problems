# Array#index is an alias for Array#find_index

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

answer = flintstones.find_index { |name| name[0,2] == 'Be' }
p answer
