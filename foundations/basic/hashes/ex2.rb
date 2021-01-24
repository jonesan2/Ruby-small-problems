hash1 = { color: "orange", food: "eggs", toy: "mermaid" }
hash2 = { class: "science", tv: "zumbo", shirt: "choir" }
hash3 = hash1.merge(hash2)
puts "Hash 1: #{hash1}"
puts "Hash 2: #{hash2}"
puts "Merge: #{hash3}"
hash4 = hash1.merge!(hash2)
puts "Hash 1: #{hash1}"
puts "Hash 2: #{hash2}"
puts "Merge!: #{hash4}"

