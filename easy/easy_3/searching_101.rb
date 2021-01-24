ORDINALS = %w(1st 2nd 3rd 4th 5th last).freeze

def prompt(message)
  puts("=> #{message}")
end

def verify_number(object)
  /\d/.match(object) && /^-?\d*\.?\d*$/.match(object)
end

def get_number(count)
  num = 0
  loop do
    prompt("Enter the #{ORDINALS[count]} number:")
    num = gets.chomp
    num = verify_number(num) ? num.to_i : nil
    break if num
    prompt('Invalid number.')
  end
  num
end

num_list = []
counter = 0
loop do
  num_list << get_number(counter)
  counter += 1
  break if counter == 5
end

last_num = get_number(counter)
appears = num_list.include?(last_num) ? 'appears' : 'does not appear'
prompt("The number #{last_num} #{appears} in #{num_list}.")
