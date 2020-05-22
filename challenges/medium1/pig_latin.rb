class PigLatin
  VOWELS = %w(a e i o u)
  CLUSTERS3 = %w(chr thr squ sch)
  CLUSTERS2 = %w(ch qu th)
  BIFORM = %w(x y)

  def self.translate(str)
    str.split.each.with_object([]) do |word, result|
      result << translate_word(word)
    end.join(' ')
  end

  def self.translate_word(str)
    front = str if VOWELS.include?(str[0, 1])
    if BIFORM.include?(str[0, 1])
      front = VOWELS.include?(str[1]) ? str[1..-1] + str[0] : str
    end
    front = str[2..-1] + str[0..1] if CLUSTERS2.include?(str[0, 2])
    front = str[3..-1] + str[0..2] if CLUSTERS3.include?(str[0, 3])
    front = str[1..-1] + str[0..0] unless front
    front + 'ay'
  end
end
