def all_caps(str)
  if str.length > 10
    str.upcase 
  end
end

puts "Enter string: "
input = gets.chomp
puts all_caps(input)
