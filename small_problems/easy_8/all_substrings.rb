def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

def substrings(str)
  str.chars.map.with_index do |_, idx|
    substrings_at_start(str.slice(idx...str.size))
  end
     .flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
