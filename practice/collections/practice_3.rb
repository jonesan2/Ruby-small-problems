ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

answer = ages.reject { |_, val| val >= 100 }
p answer
