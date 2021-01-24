# uses File.read

def longest_paragraph(text)
  paragraphs = text.split(/^$/)
  longest = paragraphs.max_by { |par| par.split.size }
  p longest.strip
  p longest.split.size
end

text = File.read('frankenstein.txt')
longest_paragraph(text)
