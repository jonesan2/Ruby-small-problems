class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  ALIASES = %w(r p s l k)

  def initialize(value)
    @value = value if VALUES.include? value
    @value = VALUES[ALIASES.find_index(value)] if ALIASES.include? value
  end

  def victorious(other_move, winning_move, losing_move1, losing_move2)
    @value == winning_move &&
      (other_move.value == losing_move1 || other_move.value == losing_move2)
  end

  def >(other_move)
    victorious(other_move, 'rock', 'scissors', 'lizard') ||
      victorious(other_move, 'paper', 'rock', 'spock') ||
      victorious(other_move, 'scissors', 'paper', 'lizard') ||
      victorious(other_move, 'lizard', 'paper', 'spock') ||
      victorious(other_move, 'spock', 'rock', 'scissors')
  end

  def <(other_move)
    !(@value == other_move.value) && !(self > other_move)
  end

  def to_s
    @value
  end

  protected

  attr_reader :value
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if (Move::VALUES.include? choice) ||
               (Move::ALIASES.include? choice.downcase)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case name
    when 'R2D2' then self.move = Move.new('rock')
    when 'Hal' then self.move = Move.new(['rock', 'scissors', 'scissors', \
                                          'scissors', 'scissors'].sample)
    when 'Chappie' then self.move = Move.new(['paper', 'lizard'].sample)
    when 'Sonny' then self.move = Move.new(Move::VALUES.sample)
    when 'Number 5' then self.move = Move.new(['spock', 'lizard', \
                                               'paper'].sample)
    end
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = []
  end

  def play
    display_welcome_message

    loop do
      handle_moves

      winner = determine_winner
      handle_winner(winner)

      next unless human.score >= 10 || computer.score >= 10

      handle_match_end(winner)
      break unless play_again?
    end

    display_goodbye_message
  end

  private

  attr_accessor :history

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def handle_moves
    human.choose
    computer.choose
    update_history
    display_moves
  end

  def update_history
    history << [human.move, computer.move]
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def handle_winner(winner)
    display_winner(winner)
    update_score(winner)
    display_score
  end

  def determine_winner
    if human.move > computer.move then human
    elsif human.move < computer.move then computer
    end
  end

  def display_winner(winner)
    winner ? puts("#{winner.name} won!") : puts("It's a tie!")
  end

  def update_score(winner)
    winner.score += 1 if winner
  end

  def display_score
    puts
    puts "Current Score: "
    puts "#{human.name} #{human.score}"
    puts "#{computer.name} #{computer.score}"
    puts
  end

  def handle_match_end(winner)
    display_history
    display_match_winner(winner)
    clear_scores
  end

  def display_history
    history.each do |round|
      puts "#{human.name}: #{round[0]}  //  #{computer.name}: #{round[1]}"
    end
  end

  def display_match_winner(winner)
    puts "#{winner.name} wins the match!"
  end

  def clear_scores
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end
end

RPSGame.new.play
