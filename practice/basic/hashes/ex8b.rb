words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |w|
  key = w.chars.sort.join
  if result.has_key?(key)
    result[key] << w
  else
    result[key] = [w]
  end
end

result.each { |k, v| puts v.to_s }
