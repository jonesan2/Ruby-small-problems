# I need to study the difference between clone and dup again.
# One difference is you can't clone a frozen object.
# clone is an exact copy, including all attributes.
# dup does not have a direct association with the original.
# In any case, you can modify on the top level without affecting the clone
# or the dup, but if you go one level deeper, you will change both.

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  card_scores = remaining_cards.map do |card|
    score(card)
  end

  sum += card_scores.sum
end

puts sum