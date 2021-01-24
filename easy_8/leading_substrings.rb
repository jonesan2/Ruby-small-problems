def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
