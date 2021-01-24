LETTERS = ('a'..'z').to_a.concat(('A'..'Z').to_a)

def cleanup(text)
  spaces = text.chars.map { |char| LETTERS.include?(char) ? char : ' ' }
  spaces.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
