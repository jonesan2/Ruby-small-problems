require 'date'

def friday_13th(year)
  num_fri_13s = 0
  today = Date.new(year, 1, 13)
  12.times do |month|
    num_fri_13s += 1 if today.friday?
    today = today >> 1
  end
  num_fri_13s
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2