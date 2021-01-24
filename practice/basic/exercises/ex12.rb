contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
# #  {
# #    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
# #    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
# #  }

keys2 = [:email, :address, :phone]
contact_data.each do |d|
  /joe/.match(d[0].downcase) ? (key1 = "Joe Smith") : (key1 = "Sally Johnson")
  d.each_with_index { |v, i| contacts[key1][keys2[i]] = v }
end 

puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]
