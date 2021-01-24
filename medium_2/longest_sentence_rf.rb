# uses File.read

def longest_sentence(text)
  sentences = text.split(/[.?!]\W/)
  longest = sentences.max_by { |sent| sent.split.size }
  p longest.strip
  p longest.split.size
end

text = File.read('frankenstein.txt')
longest_sentence(text)
