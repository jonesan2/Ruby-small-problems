items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, grain|
  puts produce.join(", ")
  puts grain
end

gather(items) do |fruit, *veggies, grain|
  puts fruit
  puts veggies.join(", ")
  puts grain
end

gather(items) do |fruit, *not_fruit|
  puts fruit
  puts not_fruit.join(", ")
end

gather(items) do |fruit, corn, veggies, grain|
  puts "#{fruit}, #{corn}, #{veggies}, and #{grain}"
end
