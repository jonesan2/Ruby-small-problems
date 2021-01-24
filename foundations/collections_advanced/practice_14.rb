hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = []
hsh.each_value do |data|
  if data[:type] == 'fruit'
    result << data[:colors].map(&:capitalize)
  elsif data[:type] == 'vegetable'
    result << data[:size].upcase
  else
    puts 'Data Error'
  end
end
p result

