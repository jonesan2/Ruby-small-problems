def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

def substrings(str)
  str.chars.map.with_index do |_, idx|
    substrings_at_start(str.slice(idx...str.size))
  end
     .flatten
end

def palindromes(str)
  substrings(str).select { |sub| sub == sub.reverse && sub.length > 1 }
end

def lowercase_alpha(str)
  str.downcase.chars.reject { |elem| elem !~ /[a-z]/i }.join
end

def palindromes_mod(str)
  palindromes(lowercase_alpha(str))
end

p palindromes_mod('a    bcd') == []
p palindromes_mod('madaM') == ['madam', 'ada']
p palindromes_mod('hello-ma&   dam-did-*madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes_mod('kn&.%Itting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
