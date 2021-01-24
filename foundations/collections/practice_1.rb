flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

answer = Hash.new
flintstones.each_with_index { |name, ind| answer[name] = ind }
p answer

