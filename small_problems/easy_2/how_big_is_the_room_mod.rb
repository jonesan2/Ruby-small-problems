SQ_FT_TO_SQ_IN = 144
IN_TO_CM = 2.54
SQ_IN_TO_SQ_CM = IN_TO_CM * IN_TO_CM

def prompt(message)
  puts("=> #{message}")
end

prompt('Enter a length in feet:')
length = gets.chomp
prompt('Enter a width in feet:')
width = gets.chomp
area = length.to_f * width.to_f
puts("The area is #{area.round(2)} square feet.")
area_sqin = area * SQ_FT_TO_SQ_IN
puts("The area is #{area_sqin.round(2)} square inches.")
area_sqcm = area_sqin * SQ_IN_TO_SQ_CM
puts("The area is #{area_sqcm.round(2)} square centimeters.")
