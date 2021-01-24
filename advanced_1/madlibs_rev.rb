NOUNS = %w(house cheese lamppost porcupine sandwich drawer tire table)
VERBS = %w(run swim bike talk read stand love whisper smile kick)
ADJECTIVES = %w(tall slow blue slick shiny smarmy orange selfish)
ADVERBS = %w(quickly stealthily deviously valiantly)

def replace_syms(wd)
  case wd
  when /^\W*N\W*$/ then wd.gsub!('N', NOUNS.sample)
  when /^\W*V\W*$/ then VERBS.sample
  when /^\W*A\W*$/ then ADJECTIVES.sample
  when /^\W*D\W*$/ then ADVERBS.sample
  else wd 
  end
end
      
def madlibs_rev(filename)
  input_text = File.read(filename)
  output_text = []
  input_text.split("\n").each do |line|
    output_line = []
    line.split(' ').each do |word|
      output_line << replace_syms(word)
    end
    output_text << output_line.join(' ')
  end
  output_text.join("\n") + "\n"
end

print madlibs_rev('madlibs_data.txt')