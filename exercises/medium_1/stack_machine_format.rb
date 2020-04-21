class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  INSTRUCTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
    @reg = 0 # register
    @stack = []
  end

  def eval(temp_hash = { degrees_c: 0 })
    tokens = format(@program, temp_hash).split
    tokens = tokens.map! { |tok| tok == tok.to_i.to_s ? tok.to_i : tok }
    loop do
      break if tokens.empty?
      command = tokens.shift
      execute_command(command)
    end
  end

  def execute_command(command)
    if command.is_a?(Integer)
      n(command)
    elsif command.is_a?(String)
      if !INSTRUCTIONS.include?(command)
        raise BadTokenError, "Invalid token: #{command}"
      end
      send(command.downcase.to_sym)
    end
  end

  def n(value)
    @reg = value
  end

  def push
    @stack << @reg
  end

  def add
    check_stack
    @reg += @stack.pop
  end

  def sub
    check_stack
    @reg -= @stack.pop
  end

  def mult
    check_stack
    @reg *= @stack.pop
  end

  def div
    check_stack
    @reg /= @stack.pop
  end

  def mod
    check_stack
    @reg %= @stack.pop
  end

  def check_stack
    raise EmptyStackError, "Empty stack!" if @stack.empty?
  end

  def pop
    check_stack
    @reg = @stack.pop
  end

  def print
    puts @reg
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

FAHRENHEIT_TO_CENTIGRADE =
  '9 PUSH 32 PUSH %<degrees_f>d SUB PUSH 5 MULT DIV PRINT'
minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
minilang.eval(degrees_f: 212)
# 100
minilang.eval(degrees_f: 32)
# 0
minilang.eval(degrees_f: -40)
# -40

MPH_TO_KPH =
  '3 PUSH %<mph>d PUSH 5 MULT DIV PRINT'
minilang = Minilang.new(MPH_TO_KPH)
minilang.eval(mph: 55)
# 91
minilang.eval(mph: 65)
# 108
minilang.eval(mph: 20)
# 33

RECTANGLE_AREA =
  '%<length>d PUSH %<width>d MULT PRINT'
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval(length: 4, width: 5)
# 20

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

begin
  Minilang.new('5 PUSH POP POP PRINT').eval
rescue StandardError => e
  puts e.message
end
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

begin
  Minilang.new('-3 PUSH 5 XSUB PRINT').eval
rescue StandardError => e
  puts e.message
end
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
