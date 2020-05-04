def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(2) { |block_arg| 5 + 3 + block_arg } == 10
p compute('c') { |block_arg| 'a' + 'b' + block_arg } == 'abc'
p compute([1]) == 'Does not compute.'