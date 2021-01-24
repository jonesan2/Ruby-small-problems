status = ['awake', 'tired'].sample

command = if status == 'awake'
  "Be productive!"
else
  "Go to sleep!"
end

puts command
