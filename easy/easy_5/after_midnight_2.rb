# This could be improved by assigning 'hours' and 'minutes' to separate
# variable names rather than to an array called hrs_and_mins. On the left
# side of the assignment, instead of an array name, you can use two
# variable names, for example:
#      hours, minutes = input_time.split(':')
# This is really cool. 
# You could also refactor the String#to_i method into this same assignment
# using Array#map. 

MINS_PER_HR = 60
HRS_PER_DAY = 24
MINS_PER_DAY = MINS_PER_HR * HRS_PER_DAY

def before_midnight(input_time)
  mins_after = after_midnight(input_time)
  (MINS_PER_DAY - mins_after) % MINS_PER_DAY
end

def after_midnight(input_time)
  hrs_and_mins = input_time.split(':')
  hrs_and_mins[0].to_i * MINS_PER_HR % MINS_PER_DAY + hrs_and_mins[1].to_i
  #  hours, minutes = input_time.split(':').map(&:to_i)
  #  (hours * MINS_PER_HR + minutes) % MINS_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
