# Input: float
# Output: string  (int - deg - int - ' - int - ")
#
# Algorithm:
#   -separate float into integer and decimal (degrees)
#   -convert the decimal into minutes and seconds
#     -multiply the decimal by 60
#     -separate the float into integer and decimal (minutes)
#       -multiply the decimal by 60
#       -round it to an integer (seconds)
#
# ** Forgot to check edge cases where seconds = 60 after rounding
#      in some of those cases, bumping up the minutes will cause 
#      the minutes to equal 60 as well, in which case degrees 
#      should get bumped up.
# ** The provided solution solves this problem by rounding before
#      the degrees and minutes values are assigned, to the nearest
#      second.
#
# ** The provided solution uses the format command to represent the
#      output string. This prevents the need to use an escape character
#      for the quotes when used together with %(). 
#    format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)

DEGREE = "\xC2\xB0"

def dms(fnum)
  degrees, decimal_minutes = fnum.divmod(1)
  minutes, decimal_seconds = (decimal_minutes * 60).divmod(1)
  seconds = (decimal_seconds * 60).round
  if seconds == 60
    seconds = 0
    minutes += 1
    if minutes == 60
      minutes = 0
      degrees += 1
    end
  end
  "#{degrees}#{DEGREE}%02d'%02d\"" % [minutes, seconds]
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
