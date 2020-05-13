=begin
class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    @text.downcase.split(/[,\s]+/).each.with_object({}) do |word, count|
      word = word.slice(/\w+('\w+)?/)
      next unless word
      count.keys.include?(word) ? count[word] += 1 : count[word] = 1
    end
  end
end
=end

class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    result = @text.downcase.scan(/[\w']+/)
    result.map! { |word| word.gsub(/\A'(.*)'\z/, '\1') }
    result.each.with_object({}) do |word, count|
      count.keys.include?(word) ? count[word] += 1 : count[word] = 1
    end
  end
end
