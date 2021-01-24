# Remember that str[start, length] is a syntactic sugar for str.slice(st, l)

def center_of(str)
  str.size.odd? ? str[str.size / 2] : str[str.size / 2 - 1, 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
