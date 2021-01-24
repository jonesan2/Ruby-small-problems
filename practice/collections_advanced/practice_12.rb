arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

result = {}
arr.each { |sub_a| result[sub_a[0]] = sub_a[1] }
p result

