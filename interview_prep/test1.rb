def method1(str)
  ch_array = str.chars.each do |ch|
    ch.upcase!
  end
  ch_array.join 
end

p method1("Hi everyone! Our session will start in about 10 minutes.")
p method1("I will send links to Zoom and Coderpad at that time. See you soon!")