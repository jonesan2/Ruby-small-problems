require 'date'

def friday_13ths(year)
  first_day = Date.new(year,1,1)
  last_day = Date.new(year,12,31)
  num_friday_13ths = 0
  (first_day..last_day).each do |today|
    num_friday_13ths += 1 if today.friday? && today.day == 13
  end
  num_friday_13ths
end

p friday_13ths(2015)