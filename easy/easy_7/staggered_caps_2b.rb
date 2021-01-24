def staggered_case(str, count: 'yes')
  return_str = ''
  count = (count == 'yes' ? true : false)
  first = true
  str.chars.each do |char|
    if char =~ /[a-zA-Z]/
      return_str << (first? ? char.upcase : char.downcase)
      first = !first
    else
      return_str << char
      first = !first if count
    end
  end .join
  return_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('I Love Launch School!', count: 'no') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
