def group_raptors(arr)
  raptors = yield(arr)
  p raptors
end

group_raptors(%w(raven finch hawk eagle)) { |_, _, *raptors| raptors }