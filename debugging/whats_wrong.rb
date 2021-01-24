arr = ["9", "8", "7", "10", "11"]
ans = arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
p ans

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 