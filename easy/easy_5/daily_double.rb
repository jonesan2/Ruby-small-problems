def crunch(text)
  crunched = ''
  text.chars.each { |char| crunched.concat(crunched[-1] != char ? char : '') }
  crunched
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
