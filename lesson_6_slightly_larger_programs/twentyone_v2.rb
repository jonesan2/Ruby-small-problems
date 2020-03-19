# Added improvements from provided solution:
# 2) The initialize_deck method can just return a fresh deck. There is no need
#    to pass it an argument.
# 3) The conditionals used for results are symbols rather than strings.
# 4) The play_again? code is a separate method.
# 5) The play_again? method checks to see if the entered string *starts_with* y
#
# Bonus features
# 1) If I were going to reduce the number of times I check the total,
#    I would modify the hands hash so that the :Player and :Dealer keys indexed
#    hashes that included a hand of cards and a total value. The functions that
#    need to access the total could do so by reading and modifying the hands 
#    hash.

SUITS = { Clubs: '♣', Diamonds: '♢', Hearts: '♡', Spades: '♠' }
VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
           '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
           'Q' => 10, 'K' => 10, 'A' => 1 }

def prompt(msg)
  puts " => #{msg}"
end

def initialize_deck
  deck = []
  SUITS.keys.each do |suit|
    VALUES.keys.each do |value|
      deck << { value: value, suit: suit }
    end
  end
  deck.shuffle
end

def deal_starting_hands!(hands, deck)
  2.times do |_|
    hands[:Player] << deck.pop
    hands[:Dealer] << deck.pop
  end
end

def card_display(card)
  "#{card[:value]}#{SUITS[card[:suit]]}  "
end

def hand_display(hand)
  hand.reduce('') { |disp, card| disp + card_display(card) }
end

def hidden_display(hand)
  "??  #{card_display(hand[1])}"
end

def display_hands(hds, hide_dealer)
  puts
  print "Dealer cards:  "
  puts hide_dealer ? hidden_display(hds[:Dealer]) : hand_display(hds[:Dealer])
  puts
  puts "Player cards:  #{hand_display(hds[:Player])}"
  puts
end

def player_hit?
  choice = ''
  loop do
    prompt("Player, choose Hit (H) or Stay (S):  ")
    choice = gets.chomp
    break if choice =~ /[hs]/i
    prompt("Sorry, that is not a valid choice.")
  end
  choice.upcase == 'H' ? true : false
end

def check_total(hnd)
  total = hnd.reduce(0) { |sum, card| sum + VALUES[card[:value]] }
  if hnd.map { |card| card[:value] }.include?('A') && total <= 11
    total += 10
  end
  total
end

def player_turn(hands, deck)
  loop do
    player_hit? ? hands[:Player] << deck.pop : break
    break if check_total(hands[:Player]) > 21
    display_hands(hands, true)
  end
end

def dealer_turn(hnd, deck)
  while check_total(hnd) < 17
    hnd << deck.pop
  end
end

def check_result(hands)
  player_total = check_total(hands[:Player])
  dealer_total = check_total(hands[:Dealer])

  if player_total > 21 then :player_bust
  elsif dealer_total > 21 then :dealer_bust
  elsif dealer_total > player_total then :dealer_win
  elsif dealer_total == player_total then :tie
  else :player_win
  end
end

def display_result(rslt)
  case rslt
  when :player_bust then prompt("Player BUST! Dealer wins.")
  when :dealer_bust then prompt("Dealer BUST! Player wins.")
  when :dealer_win then prompt("Dealer wins!")
  when :tie then prompt("It's a push!")
  when :player_win then prompt("Player wins!")
  end
end

def play_again?
  prompt("Would you like to play again? (Y/N)")
  again = gets.chomp
  again.upcase.start_with?('Y')
end

prompt('Welcome to the Twenty-One Game')

loop do
  hands = { Player: [], Dealer: [] }
  deck = initialize_deck

  deal_starting_hands!(hands, deck)
  display_hands(hands, true)

  player_turn(hands, deck)
  dealer_turn(hands[:Dealer], deck)

  result = check_result(hands)
  display_hands(hands, false)
  display_result(result)

  break unless play_again?
end

prompt("Thank you for playing Twenty-One")
