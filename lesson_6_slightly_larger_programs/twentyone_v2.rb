# Twenty-One Game
#  version 2 with Bonus Features Added
#
# Questions:
#   1) What to do with parameter names in methods that parallel the names of
#        the arguments in the main body?
#   2) It seems there is often a tradeoff between computational efficiency and
#        code readability. I was under the impression that in Ruby, code
#        readability normally takes precedence. Is this accurate?

SUITS = { Clubs: '♣', Diamonds: '♢', Hearts: '♡', Spades: '♠' }
VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
           '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
           'Q' => 10, 'K' => 10, 'A' => 1 }
MAX_TOTAL = 31
DEALER_STOP = 27

def prompt(msg)
  puts " => #{msg}"
end

def game_startup
  system 'clear'
  prompt('Welcome to Launch School Blackjack!')
  prompt('Press enter to begin.')
  gets.chomp
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
    hands[:Player][:cards] << deck.pop
    update_total!(hands[:Player])
    hands[:Dealer][:cards] << deck.pop
    update_total!(hands[:Dealer])
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

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_game(hds, scr, hide_dealer)
  system 'clear'
  puts "** YOU ARE PLAYING LAUNCH SCHOOL BLACKJACK **"
  puts "The first to win 5 hands wins the match."
  puts "Maximum total allowed is #{MAX_TOTAL}. Dealer stays at #{DEALER_STOP}."
  puts "Current match score:  Dealer #{scr[:Dealer]}, Player #{scr[:Player]}"
  puts
  print "Dealer cards:  "

  if hide_dealer
    puts hidden_display(hds[:Dealer][:cards])
  else
    puts hand_display(hds[:Dealer][:cards])
  end

  puts
  puts "Player cards:  #{hand_display(hds[:Player][:cards])}"
  puts
  print "Totals:  Dealer "
  print(hide_dealer ? "??, " : "#{hds[:Dealer][:value]}, ")
  puts "Player #{hds[:Player][:value]}"
  puts
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def player_hit?(hds, scr)
  choice = ''
  loop do
    prompt("Player, choose (H)it or (S)tay:  ")
    choice = gets.chomp
    break if choice =~ /^[hs]$|^hit$|^stay$/i
    display_game(hds, scr, true)
    prompt("Sorry, that is not a valid choice.")
  end
  choice.upcase.chr == 'H' ? true : false
end

def update_total!(hnd)
  total = hnd[:cards].reduce(0) { |sum, card| sum + VALUES[card[:value]] }
  if hnd[:cards].map { |card| card[:value] }.include?('A') \
     && total <= MAX_TOTAL - 10
    total += 10
  end
  hnd[:value] = total
end

def player_turn!(hands, score, deck)
  loop do
    player_hit?(hands, score) ? hands[:Player][:cards] << deck.pop : break
    update_total!(hands[:Player])
    display_game(hands, score, true)
    break if hands[:Player][:value] > MAX_TOTAL
  end
end

def dealer_turn!(hnd, deck)
  loop do
    hnd[:value] < DEALER_STOP ? hnd[:cards] << deck.pop : break
    update_total!(hnd)
  end
end

def check_result(hands)
  if hands[:Player][:value] > MAX_TOTAL then :player_bust
  elsif hands[:Dealer][:value] > MAX_TOTAL then :dealer_bust
  elsif hands[:Dealer][:value] > hands[:Player][:value] then :dealer_win
  elsif hands[:Dealer][:value] == hands[:Player][:value] then :tie
  else :player_win
  end
end

def update_score!(rslt, scr)
  case rslt
  when :player_bust then scr[:Dealer] += 1
  when :dealer_bust then scr[:Player] += 1
  when :dealer_win then scr[:Dealer] += 1
  when :player_win then scr[:Player] += 1
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

def play_again?(hds, scr)
  again = nil
  loop do
    prompt("Would you like to play again? (Y/N)")
    again = gets.chomp
    break if again =~ /^[yn]$|^yes$|^no$/i
    display_game(hds, scr, true)
    prompt("Sorry, that is not a valid choice.")
  end
  again.upcase.chr == 'Y' ? true : false
end

game_startup
score = { Player: 0, Dealer: 0 }

loop do
  hands = { Player: { cards: [], value: 0 },
            Dealer: { cards: [], value: 0 } }
  deck = initialize_deck

  deal_starting_hands!(hands, deck)
  display_game(hands, score, true)

  player_turn!(hands, score, deck)
  dealer_turn!(hands[:Dealer], deck) if hands[:Player][:value] <= MAX_TOTAL

  result = check_result(hands)
  update_score!(result, score)
  display_game(hands, score, false)
  display_result(result)

  break if score.values.include?(5) || !play_again?(hands, score)
end

prompt("Thank you for playing Twenty-One")
