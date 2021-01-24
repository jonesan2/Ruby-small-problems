SQ_METERS_TO_SQ_FT = 10.7639

def prompt(message)
  puts("=> #{message}")
end

prompt('Enter a length in meters:')
length = gets.chomp
prompt('Enter a width in meters:')
width = gets.chomp
area = length.to_f * width.to_f
puts("The area is #{area.round(2)} square meters.")
area_sqft = area * SQ_METERS_TO_SQ_FT
puts("The area is #{area_sqft.round(2)} square feet.")
