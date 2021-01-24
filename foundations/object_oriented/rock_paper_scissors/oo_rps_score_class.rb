class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Score
  def initialize
    @wins = 0
  end

  def >=(num)
    @wins >= num
  end

  def add_win
    @wins += 1
  end

  def to_s
    @wins.to_s
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = Score.new
    set_name
  end

  def add_win
    score.add_win
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

  def convert(choice)
    case choice.downcase
    when 'r' then 'rock'
    when 'p' then 'paper'
    when 's' then 'scissors'
    else choice
    end
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = convert(gets.chomp)
      break if Move::VALUES.include? choice
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
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
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
    winner&.add_win
  end

  def display_score
    puts
    puts "Current Score: "
    puts "#{human.name} #{human.score}"
    puts "#{computer.name} #{computer.score}"
    puts
  end

  def display_match_winner(winner)
    puts "#{winner.name} wins the match!"
  end

  def clear_scores
    human.score = Score.new
    computer.score = Score.new
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

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves

      winner = determine_winner
      display_winner(winner)

      update_score(winner)
      display_score

      next unless human.score >= 10 || computer.score >= 10
      display_match_winner(winner)
      clear_scores
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
