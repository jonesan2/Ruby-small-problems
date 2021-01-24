puts('=> Please write word or multiple words:')
input = gets.chomp
puts("There are #{input.split.join.length} characters in #{input}")
