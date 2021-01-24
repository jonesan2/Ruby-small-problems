def staggered_case(str)
  return_str = ''
  str.chars.each_with_index do |char, index|
    return_str << (index.odd? ? char.downcase : char.upcase)
  end .join
  return_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
