class Deck
  SUITS = ["\u2663", "\u2662", "\u2661", "\u2660"]
  VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
             '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
             'Q' => 10, 'K' => 10, 'A' => 1 }

  def initialize
    @stack = []
    VALUES.keys.each do |rank|
      SUITS.each do |suit|
        @stack << Card.new(rank, suit, VALUES[rank])
      end
    end
    @stack.shuffle!
  end

  def deal
    @stack.pop
  end
end

class Card
  attr_reader :value, :rank

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end

class Player
  attr_reader :hand

  def initialize
    clear
  end

  def <<(card)
    @hand << card
  end

  def busted?(limit)
    total > limit
  end

  def total
    tot = hand.sum(&:value)
    @hand.map(&:rank).any?('A') && tot <= 11 ? tot + 10 : tot
  end

  def clear
    @hand = []
  end
end

class Human < Player
  attr_accessor :name, :chips

  def initialize(name = "Unnamed", chips = 0)
    @name = name
    @chips = chips
    super()
  end

  def input_name
    name = nil
    loop do
      puts
      puts "Enter Player name:"
      name = gets.chomp
      break unless name == ''
      puts "Sorry, you must enter a name for yourself!"
    end
    self.name = name
  end

  def stay?
    choice = nil
    loop do
      puts "Hit (h) or Stay (s)?"
      choice = gets.chomp.downcase
      break if ['hit', 'h', 'stay', 's'].include?(choice)
      puts "Sorry, invalid input."
    end
    return false if choice == 'h' || choice == 'hit'
    true
  end

  def chips_left?
    chips > 0
  end
end

class Dealer < Player
  DEALER_MAX = 17
end

class Result
  attr_reader :winner, :bust

  def initialize(winner = nil, bust = false)
    @winner = winner
    @bust = bust
  end
end

class Display
  attr_reader :human, :dealer

  def initialize(human, dealer)
    @human = human
    @dealer = dealer
  end

  def clear
    system 'clear'
  end

  def welcome_message
    puts "Welcome to Twenty-One!"
  end

  def header(round_number, wager)
    clear
    puts "Twenty-One Game                                Round #{round_number}"
    puts
    print "#{human.name} has #{human.chips} Chips        "
    puts "Current Wager: #{wager}"
    puts '-------------------------------------------------------'
  end

  def table(show_dealer_card)
    dealer_table(show_dealer_card)
    human_table
  end

  def results(result)
    puts

    if result.bust
      puts "Dealer busted!" if result.winner == human
    else puts "#{human.name} busted!"
    end

    case result.winner
    when human then puts "#{human.name} wins!"
    when dealer then puts "Dealer wins!"
    else puts "It's a tie!"
    end
  end

  def goodbye_message
    puts
    puts "Thank you for playing Twenty-One. Goodbye!"
  end

  private

  def dealer_table(show_dealer_card)
    puts
    puts "Dealer"
    if show_dealer_card
      (0...dealer.hand.size).each { |idx| print "#{dealer.hand[idx]} " }
      puts("          Dealer total: #{dealer.total}")
    else
      puts "#{dealer.hand.first} ??"
    end
  end

  def human_table
    puts
    puts human.name
    (0...human.hand.size).each { |idx| print "#{human.hand[idx]} " }
    puts "          #{human.name} total: #{human.total}"
    puts
  end
end

class TwentyoneGame
  STARTING_CHIPS = 100
  MAX_HAND_VALUE = 21

  def initialize
    @human = Human.new('Player', STARTING_CHIPS)
    @dealer = Dealer.new
    @round_number = 0
    @deck = Deck.new
    @display = Display.new(@human, @dealer)
  end

  def play
    game_setup

    loop do
      reset_round
      take_wager
      play_round
      end_round
      break unless human.chips_left? && play_again?
    end

    display.goodbye_message
  end

  private

  attr_accessor :round_number, :wager
  attr_reader :human, :dealer, :display, :deck, :result

  def game_setup
    display.clear
    display.welcome_message
    human.input_name
  end

  def reset_round
    @round_number += 1
    @wager = 0
    @deck = Deck.new
    human.clear
    dealer.clear
    display.header(@round_number, @wager)
  end

  def take_wager
    this_wager = nil
    loop do
      puts
      puts "How many chips would you like to wager?"
      this_wager = gets.chomp
      wager_error = check_wager(this_wager)
      break unless wager_error
      puts wager_error
    end
    @wager = this_wager.to_i
  end

  def play_round
    deal_starting_hands
    human_turn
    dealer_turn if !human.busted?(MAX_HAND_VALUE)
  end

  def end_round
    @result = find_result
    process_wager
    display.header(round_number, wager)
    display.table(true)
    display.results(result)
  end

  def check_wager(w)
    return "Sorry, wager must be a whole number." if w.to_i.to_s != w
    return "Sorry, wager must be greater than zero." if w.to_i < 0
    return "Sorry, you don't have enough chips." if w.to_i > human.chips
    nil
  end

  def deal_starting_hands
    2.times do |_|
      human << deck.deal
      dealer << deck.deal
    end
  end

  def human_turn
    loop do
      display.header(round_number, wager)
      display.table(false)
      break if human.busted?(MAX_HAND_VALUE) || human.stay?
      human << deck.deal
    end
  end

  def dealer_turn
    loop do
      break if dealer.total >= Dealer::DEALER_MAX
      dealer << deck.deal
    end
  end

  def find_result
    if human.busted?(MAX_HAND_VALUE)
      Result.new(dealer, true)
    elsif dealer.busted?(MAX_HAND_VALUE)
      Result.new(human, true)
    else find_result_no_bust
    end
  end

  def find_result_no_bust
    if dealer.total > human.total
      Result.new(dealer, false)
    elsif human.total > dealer.total
      Result.new(human, false)
    else Result.new()
    end
  end

  def process_wager
    case result.winner
    when human then human.chips += wager
    when dealer then human.chips -= wager
    end
    @wager = 0
  end

  def play_again?
    again = nil
    loop do
      puts
      puts "Would you like to play again? (Y/N)"
      again = gets.chomp.downcase
      break if ['yes', 'y', 'no', 'n'].include?(again)
      puts("Sorry, that is not a valid choice.")
    end
    again.chr == 'y'
  end
end

game = TwentyoneGame.new
game.play
