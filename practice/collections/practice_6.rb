flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

answer = flintstones.map! { |name| name[0,3] }
p answer
