def staggered_case(str, first: 'up')
  return_str = ''
  str.chars.each_with_index do |char, index|
    if first == 'up'
      return_str << (index.odd? ? char.downcase : char.upcase)
    elsif first == 'down'
      return_str << (index.odd? ? char.upcase : char.downcase)
    end
  end .join
  return_str
end

p staggered_case('I Love Launch School!', first: 'up') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('I Love Launch School!', first: 'down') == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
