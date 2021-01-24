# Accepts an integer as number of minutes offset from midnight
# Returns the time of day in hh:mm format
#
# The Numeric#divmod method will return the quotient and modulus in one command
# The '%02d' format returns a two digit number with leading zeros as needed
#
# Data Structures
#   Integer input
#   String output
#   Integer storage of offset minutes

MINS_IN_DAY = 1440
MINS_IN_HOUR = 60

def time_of_day(int_mins)
  offset_mins = int_mins % MINS_IN_DAY
  hour, mins = offset_mins.divmod(MINS_IN_HOUR)
  format('%02d:%02d', hour, mins)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
