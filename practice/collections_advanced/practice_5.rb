# I need to study the inject method in more detail so I know the syntactic
# options by heart. It seems to have different options for arguments
# depending on whether the block uses {} or do..end, or perhaps I need
# to use certain parentheses I'm not yet aware of with the do..end
# construction. 
#
# The answer was in the first discussion question. The problem was
# the 'p' command in front of the reduce. 

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = munsters.values.reduce(0) do |sum, data| 
  data['gender'] == 'male' ? sum + data['age'] : sum
end
p total_male_age

