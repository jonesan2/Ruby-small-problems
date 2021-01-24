statement = "The Flintstones Rock"

answer = Hash.new(0)
statement.chars.each { |c| answer[c] += 1 unless c == ' ' }
p answer
