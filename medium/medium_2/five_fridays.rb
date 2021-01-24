require 'date'

def five_fridays(year)
  num_fris = Array.new(12, 0) 
  start_date = Date.new(year, 1, 1)
  num_days = Date.leap?(year) ? 366 : 365
  (0...num_days).each do |day|
    today = start_date + day
    num_fris[today.month - 1] += 1 if today.friday?
  end
  num_fris.count(5)
end

p five_fridays(2003)
p five_fridays(2020)
p five_fridays(2019)
p five_fridays(2018)
p five_fridays(2017)
p five_fridays(2021)
p five_fridays(2022)