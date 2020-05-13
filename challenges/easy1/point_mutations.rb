class DNA
  def initialize(strand)
    @base = strand.chars
  end

  def hamming_distance(mutation)
    @base.zip(mutation.chars).count { |base, mut| mut && base != mut }
  end
end

=begin External Iteration Solution
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_2)
    hd = 0
    s1, s2 = @strand.each_char, strand_2.each_char
    loop do
      hd += 1 unless s1.next == s2.next
    end
    hd
  end
end
=end
