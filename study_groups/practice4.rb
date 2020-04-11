# Your goal is to implement a difference function, which subtracts one list 
# from another and returns the result.
#
# It should remove all values from list a, which are present in list b.
# 
# array_diff([1,2],[1]) == [2]
# If a value is present in b, all of its occurrences must be removed 
# from the other:
# array_diff([1,2,1,1],[1]) == [2]
#
# Values in the output array should occur in the same order as they
# occur in the input array.

p array_diff([1,2],[1]) == [2]
p array_diff([1,2,1,1],[1]) == [2]
p array_diff([23,45,67,89,12,123,12],[23,67,123]) == [45,89,12,12]