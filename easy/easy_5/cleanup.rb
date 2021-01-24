# If MatchData is not used, use =~ rather than String#match?
#
# First Attempt: 
# 
# def cleanup(input)
#   trailer = input =~ /[^\w]+$/ ? ' ' : ''
#   input.split(/[^\w]+/).join(' ').concat(trailer)
# end

def cleanup(input)
  input.gsub(/[^\w]+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
