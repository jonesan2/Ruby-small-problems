DEGREE = "\xC2\xB0".freeze
MAX_DEGS = 360
MINS_PER_DEG = 60
SECS_PER_MIN = 60
SECS_PER_DEG = MINS_PER_DEG * SECS_PER_MIN

def dms(fnum)
  total_seconds = (fnum * SECS_PER_DEG).round
  degrees, remaining_minutes = total_seconds.divmod(SECS_PER_DEG)
  degrees = degrees % MAX_DEGS
  minutes, seconds = remaining_minutes.divmod(MINS_PER_DEG)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
