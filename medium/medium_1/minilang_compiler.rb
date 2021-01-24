OP_HASH = { '+' => 'ADD ', '-' => 'SUB ', '*' => 'MULT ',
            '/' => 'DIV ', '%' => 'MOD ' }.freeze

def minilang(commands)
  register = [0] # initialize the register to zero
  stack = []
  command_arr = commands.split
  command_arr.each do |command|
    case command
    when /^-?\d+$/ then register = command.to_i
    when 'PUSH' then stack.push(register)
    when 'PRINT' then puts register
    when /ADD|SUB|MULT|DIV|MOD|POP/
      if stack.empty?
        return 'Error: empty stack'
      else case command
           when 'ADD' then register += stack.pop
           when 'SUB' then register -= stack.pop
           when 'MULT' then register *= stack.pop
           when 'DIV' then register /= stack.pop
           when 'MOD' then register %= stack.pop
           when 'POP' then register = stack.pop
           end
      end
    else return 'Error: Invalid token'
    end
  end
  nil
end

def convert_to_miniprog(syms)
  mini_prog = ''
  operation_stack = []
  syms.reverse_each do |sym|
    case sym
    when /[0-9]/ then mini_prog << sym << ' '
    when %r{[\*\%+-/]}
      operation_stack << sym
      mini_prog << 'PUSH '
    when '('
      2.times do |_|
        unless operation_stack.empty?
          op = operation_stack.pop
          mini_prog << OP_HASH[op]
        end
      end
    end
  end
  mini_prog << 'PRINT'
  mini_prog
end

def compiler(expression)
  syms = expression.to_s.chars
  syms.delete(' ')
  convert_to_miniprog(syms)
end

minilang(compiler('(3 + (4 * 5) - 7) / (5 % 3)'))
