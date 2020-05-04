def any?(arr, &blk)
  arr.each { |item| return true if blk.call(item) }
  false
end
