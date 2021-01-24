class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end
  
class Minilang
  INSTRUCTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program.split.map do |input|
      input.to_i.to_s == input ? input.to_i : input
    end
    @reg = 0 # register
    @stack = []
  end

  def eval
    loop do
      break if @program.empty?
      command = @program.shift
      if command.is_a?(Integer)
        n(command)
      elsif command.is_a?(String)
        if !INSTRUCTIONS.include?(command)
          raise BadTokenError, "Invalid token: #{command}" 
        end
        send(command.downcase.to_sym)
      end
    end
  end

  def n(value)
    @reg = value
  end

  def push
    @stack << @reg
  end

  def add
    @reg += @stack.pop
  end

  def sub
    @reg -= @stack.pop
  end

  def mult
    @reg *= @stack.pop
  end

  def div
    @reg /= @stack.pop
  end

  def mod
    @reg %= @stack.pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @reg = @stack.pop
  end

  def print
    puts @reg
  end
end

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
