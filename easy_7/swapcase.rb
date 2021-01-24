def swapcase(str)
  str.chars.map do |char|
    char =~ /[a-z]/ ? char.upcase : char.downcase
  end .join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'