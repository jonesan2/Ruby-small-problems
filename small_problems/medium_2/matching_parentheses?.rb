# Enumerable#reduce requires two arguments

def balanced?(str)
  bracket_state = { curved: 0, square: 0, curly: 0 }
  quote_state = { single: true, double: true }
  str.chars.reduce(true) do |_, chr|
    case chr
    when '(' then bracket_state[:curved] += 1
    when ')' then bracket_state[:curved] -= 1
    when '[' then bracket_state[:square] += 1
    when ']' then bracket_state[:square] -= 1
    when '{' then bracket_state[:curly] += 1
    when '}' then bracket_state[:curly] -= 1
    when "'" then quote_state[:single] = !quote_state[:single]
    when '"' then quote_state[:double] = !quote_state[:double]
    end
    return false if bracket_state.values.include?(-1)
    bracket_state.values.all?(0) && quote_state.values.all?(true) ? true : false
  end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false