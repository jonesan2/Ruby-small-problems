# It's better to make the toggle variable ('first') a boolean, 
# and then you can toggle it using first = !first,
# and you only have to write that code on one line instead of two!

def staggered_case(str, first: 'up')
  return_str = ''
  str.chars.each do |char|
    if char =~ /[a-zA-Z]/
      if first == 'up'
        return_str << char.upcase
        first = 'down'
      else
        return_str << char.downcase
        first = 'up'
      end
    else
      return_str << char
    end
  end .join
  return_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
