names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(arr)
  arr.sample
end

def activity(arr)
  arr.sample
end

def sentence(w1, w2)
  "#{w1} enjoys #{w2}!"
end

puts sentence(name(names), activity(activities))
