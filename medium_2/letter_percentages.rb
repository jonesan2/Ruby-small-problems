# Array#count uses == to compare rather than ===
#   BUT you can still use Array#count with regex by calling a block
# #map returns an Array, even when called on a Hash

def letter_percentages(str)
  counts = Hash.new(0)
  letters = str.chars

  counts[:lowercase] = letters.count { |c| c =~ /[a-z]/ }
  counts[:uppercase] = letters.count { |c| c =~ /[A-Z]/ }
  counts[:neither] = letters.count { |c| c =~ /[^a-zA-Z]/ }

  counts.each do |typ, count| 
    counts[typ] = (count * 100 / letters.size.to_f).round(2)
  end
  counts
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')