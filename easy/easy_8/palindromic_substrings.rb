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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
