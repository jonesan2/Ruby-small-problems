SUFFIX_HASH = { 0 => 'th',
                1 => 'st',
                2 => 'nd',
                3 => 'rd' }

def century(year)
  c_year = year.to_i - 1
  cen = c_year / 100 + 1
  if (cen / 10) % 10 == 1 # if the tens digit is 1
    suffix = 'th'
  elsif cen % 10 >= 4
    suffix = 'th'
  else suffix = SUFFIX_HASH[cen % 10]
  end
  cen.to_s + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
