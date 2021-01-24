sun = ['visible', 'hidden'].sample
puts "The clouds are blocking the sun!" unless sun == 'visible'

if sun == 'visible'
  puts "The sun is so bright!"
end
