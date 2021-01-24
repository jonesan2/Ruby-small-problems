=begin
input: array of strings
output: String of largest common prefix

initialize output string as empty
find the length of the shortest string
  --use reduce on the array and save the smallest size in a variable
iterate over a range of indexes as long as the shortest string
for each index, test if all characters are the same at that index
  --iterate over the words array and reduce to true or false if
     each character is the same or not
if so, shovel that character into the output string
if not, break and return the output string
=end

def common_prefix(arr)
  output = ''
  shortest_length = arr.reduce(arr[0].size) do |shortest, word|
    word.size < shortest ? word.size : shortest
  end
  (0...shortest_length).each do |idx|
    current_char = arr[0][idx]
    all_same = arr.reduce(true) do |same, word|
      word[idx] == current_char && same 
    end
    all_same ? output << current_char : break
  end
  output
end

p common_prefix(["flower","flow","flight"]) == "fl"
p common_prefix(["dog","racecar","car"]) == ""
p common_prefix(["interspecies","interstellar","interstate"]) == "inters"
p common_prefix(["throne","dungeon"]) == ""
p common_prefix(["throne","throne"]) == "throne"