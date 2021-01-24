# Problem
# Examples
# Data Structures
#    Stack: array
#    Register: one-item array (to make it easier to modify in a method)
# Algorithm
#    Create a method for each operation
#    The main program is a large case statement
# Code

def n(val, reg)
  reg[0] = val 
end

def push(reg, stk)
  stk << reg[0]
end

def add(reg, stk)
  reg[0] = reg[0] + stk.pop
end

def subt(reg, stk)
  reg[0] = reg[0] - stk.pop
end
 
def mult(reg, stk)
  reg[0] = reg[0] * stk.pop
end
 
def div(reg, stk)
  reg[0] = reg[0] / stk.pop
end

def mod(reg, stk)
  reg[0] = reg[0] % stk.pop
end

def pops(reg, stk)
  reg[0] = stk.pop
end

def prin(reg)
  puts reg[0]
end
 
def minilang(commands)
  register = [0] # initialize the register to zero
  stack = []
  command_arr = commands.split
  command_arr.each do |command|
    case command
    when /^-?\d+$/ then n(command.to_i, register) 
    when 'PUSH' then push(register, stack)
    when 'ADD' then add(register, stack)
    when 'SUB' then subt(register, stack)
    when 'MULT' then mult(register, stack) 
    when 'DIV' then div(register, stack)
    when 'MOD' then mod(register, stack)
    when 'POP' then pops(register, stack)
    when 'PRINT' then prin(register)
    end
  end
end
