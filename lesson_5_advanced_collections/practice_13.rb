# This code would be shorter with Enumerable#sort_by
# result = arr.sort_by do |sub_array|
#            sub_array.select { |num| num.odd? }
#          end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

result = arr.sort do |a, b|
  a.reject { |num| num.even? } <=> b.reject { |num| num.even? }
end
p result

