# This is an important solution to have mentally ready:
#
# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

def letter_case_count(str)
  result_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    case char
    when /[a-z]/ then result_hash[:lowercase] += 1
    when /[A-Z]/ then result_hash[:uppercase] += 1
    else result_hash[:neither] += 1
    end
  end
  result_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
