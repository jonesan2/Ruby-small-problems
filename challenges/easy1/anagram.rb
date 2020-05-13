class Anagram
  def initialize(str)
    @base = str.downcase
    @letters = str.downcase.chars.sort
  end

  def match(arr)
    arr.select do |word|
      word.downcase != @base &&
        word.downcase.chars.sort == @letters
    end
  end
end
