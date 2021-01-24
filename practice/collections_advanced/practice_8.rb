hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |arr|
  arr.each do |str|
    str.chars.each { |char| puts char if char =~ /[aeiou]/i }
  end
end
