# 1) Hash#has_key? Hash#include? Hash#member? and Hash#key? are all equivalent.
#    They all check to see if a certain key is present in a certain hash.
# 2) String#swapcase String#capitalize
# 3) Hash#merge combines two hashes
# 4) String#match and String#match? have the format string_name.match(pattern)
# 5) To push multiple items into an array, use Array#concat with a %w argument 
# 6) String#slice! and String#slice
# 7) String#count
# 8) String#center

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge!(additional_ages)

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match?('Dino')

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones << 'Dino'
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
flintstones.push('Dino').push('Hoppy') 
flintstones << 'Dino' << 'Hoppy'
flintstones.concat(%w(Dino Hoppy)) # Apparently this is the preferred method

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..advice.index('house')-1)
# This returns "Few things in life are as important as " and leaves advice
# assigned to: "house training your pet dinosaur."
advice.slice!(0, advice.index('house')-1)
# A comma is better than a range in this case because the comma goes up to,
# but does not include, the second index, while the two-dot range is inclusive.

statement = "The Flintstones Rock!"
statement.count('t')

# Center a Title
# title = "Flintstone Family Members"
(0...(40-title.length)/2).each { |_| print ' ' }; puts title
# but you could also just use:
title.center(40)
