class Scrabble
  def initialize(str)
    @word = str.instance_of?(String) && str =~ /\A[a-zA-Z]+\z/ ? str : ''
  end

  def score
    @word.each_char.with_object([]) { |char, scr| scr << char_score(char) }.sum
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  private

  def char_score(char)
    tiles = { %w(a e i o u l n r s t) => 1,
              %w(d g) => 2,
              %w(b c m p) => 3,
              %w(f h v w y) => 4,
              %w(k) => 5,
              %w(j x) => 8,
              %w(q z) => 10 }
    tiles.each_key.with_object([]) do |key, scr|
      scr << tiles[key] if key.include?(char.downcase)
    end.sum
  end
end
