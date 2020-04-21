class Card
  VALUES = {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
            10 => 10, 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(other_card)
    if rank == other_card.rank
      SUIT_VALUES[suit] <=> SUIT_VALUES[other_card.suit]
    else
      VALUES[rank] <=> VALUES[other_card.rank]
    end
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  def ==(other_card)
    to_s == other_card.to_s
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    @stack = []
    @stack = create
  end
  
  def create
    RANKS.each do |r| 
      SUITS.each do |s| 
        @stack << Card.new(r, s)
      end
    end
    @stack.shuffle!
  end
  
  def draw
    create if @stack.empty? 
    @stack.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
