contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
# #  {
# #    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
# #    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
# #  }

keys2 = [:email, :address, :phone]
contacts.each_with_index do |(name, hash), idx|
  keys2.each_with_index { |key2, idx2| hash[key2] = contact_data[idx][idx2] }
end
puts contacts
