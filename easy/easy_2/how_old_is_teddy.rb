LOW_END = 20
HIGH_END = 200

def prompt(message)
  puts("=> #{message}")
end

prompt('Enter a name:')
name = gets.chomp
name = 'Teddy' if name == ''
age = rand(LOW_END..HIGH_END)
puts "#{name} is #{age} years old!"
