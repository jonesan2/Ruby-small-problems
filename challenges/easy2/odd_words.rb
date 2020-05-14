class String
  def flip_odd_words
    word = []
    partition('.')[0..1].join.each_char.with_object([]) do |ch, result|
      if /[. ]/.match(ch)
        result << (result.size.even? ? word.join : word.reverse.join) + ch
        word = []
      else word << ch
      end
    end.join
  end
end
