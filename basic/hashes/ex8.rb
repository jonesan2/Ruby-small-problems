words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

sorted_words = words.map { |w| w.chars.sort.join }
letter_sets = sorted_words.uniq
anagrams = []
letter_sets.each_with_index { |v, i| anagrams[i] = [] }
words.each do |val|
  letter_sets.each_with_index do |set, idx|
    if val.chars.sort.join == set
      anagrams[idx] << val
      break
    end
  end
end

anagrams.each { |list| puts list.to_s }
