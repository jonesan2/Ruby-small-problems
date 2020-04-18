module Formatting
  def joinor(arr, punc = ',', conj = 'or')
    case arr.size
    when 0 then ''
    when 1 then arr[0]
    when 2 then arr.join(" #{conj} ")
    else arr.clone.insert(-2, "#{conj} #{arr[-1]}").slice(0...-1).join(punc)
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    draw_row([1, 2, 3])
    puts '-----+-----+-----'
    draw_row([4, 5, 6])
    puts '-----+-----+-----'
    draw_row([7, 8, 9])
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      if marked_same?(@squares.values_at(*line))
        return @squares[line.first].marker
      end
    end
    nil
  end

  # returns first winning key found, or nil
  def win_key(player_marker)
    WINNING_LINES.each do |line|
      current_squares = @squares.values_at(*line)
      if win_or_block_open?(current_squares)
        next unless current_squares.any?(player_marker)
        return line[line.find_index { |i| @squares[i].unmarked? }]
      end
    end
    nil
  end

  # returns first blocking key found, or nil
  def block_key(player_marker)
    WINNING_LINES.each do |line|
      current_squares = @squares.values_at(*line)
      if win_or_block_open?(current_squares)
        next unless current_squares.none?(player_marker)
        return line[line.find_index { |i| @squares[i].unmarked? }]
      end
    end
    nil
  end

  private

  def draw_row(arr)
    square_values = arr.map { |idx| "  #{@squares[idx]}  " }

    puts '     |     |'
    puts square_values.join('|')
    puts '     |     |'
  end

  def marked_same?(squares)
    squares.all?(squares.first) && squares.first.marked?
  end

  def win_or_block_open?(line)
    return false unless line.map(&:unmarked?).count(true) == 1
    marked_same?(line.select(&:marked?))
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def ==(other_square)
    marker == other_square.marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end

class TTTGame
  include Formatting

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_PLAYER = 'choose'

  @@human_score = 0
  @@computer_score = 0

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER, 'Human')
    @computer = Player.new(COMPUTER_MARKER, 'Computer')
  end

  def play
    display_welcome_message
    game_setup

    loop do
      play_one_game
      break unless no_match_winner? && play_again?
      display_play_again_message
      reset
    end

    display_goodbye_message
  end

  private

  def game_setup
    @human.name = choose_player_name
    puts
    @human.marker = choose_marker
    puts
    @computer.name = choose_computer_name
    puts
    reset
  end

  def play_one_game
    display_board
    make_moves
    game_end
  end

  def choose_player_name
    choice = nil
    loop do
      puts "Enter your player name:"
      choice = gets.chomp
      break if choice != ''
      puts "Sorry, must enter a name"
    end
    choice
  end

  def choose_marker
    choice = nil

    loop do
      marker_prompt
      choice = gets.chomp
      if choice == '' then choice = HUMAN_MARKER end # default marker

      break if choice.length == 1 && choice != COMPUTER_MARKER
      puts "Sorry, you must choose an unused one-character marker."
      puts
    end

    choice
  end

  def marker_prompt
    puts "Pick your one-character game marker. '#{COMPUTER_MARKER}' is taken."
    puts "   (default = '#{HUMAN_MARKER}'):"
  end

  def choose_computer_name
    choice = nil
    loop do
      puts "Enter the computer's name:"
      choice = gets.chomp
      break if choice != ''
      puts "Sorry, must enter a name"
    end
    choice
  end

  def reset
    board.reset

    # set first player
    case FIRST_PLAYER
    when 'human' then @current_player = @human
    when 'computer' then @current_player = @computer
    when 'choose' then @current_player = choose_first_player
    end

    clear
  end

  def choose_first_player
    choice = nil
    loop do
      puts "Choose first player, human or computer (h/c)"
      choice = gets.chomp.downcase
      break if ['h', 'c', 'human', 'computer'].include?(choice)
      puts "Sorry, you must choose human (h) or computer (c)."
      puts
    end
    return @human if choice == 'human' || choice == 'h'
    @computer
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    clear
    puts 'Welcome to Tic Tac Toe!'
    puts 'The first player to 5 wins the match.'
    puts ''
  end

  def display_board
    print "#{human.name} is #{human.marker}. "
    puts "#{computer.name} is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def make_moves
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = @computer
    else
      computer_moves
      @current_player = @human
    end
  end

  def human_turn?
    @current_player == @human
  end

  def human_moves
    square = nil

    loop do
      puts "Choose a square (#{joinor(board.unmarked_keys, ', ', 'or')}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    cm = computer.marker

    win_key = board.win_key(cm)
    block_key = board.block_key(cm)
    open_keys = board.unmarked_keys

    if win_key then board[win_key] = cm
    elsif block_key then board[block_key] = cm
    elsif open_keys.include?(5) then board[5] = cm
    else board[open_keys.sample] = cm
    end
  end

  def game_end
    display_result
    update_score
    display_score
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "#{@human.name} won!"
    when computer.marker
      puts "#{@computer.name} won!"
    else
      puts "The board is full!"
    end
  end

  def update_score
    @@human_score += 1 if board.winning_marker == human.marker
    @@computer_score += 1 if board.winning_marker == computer.marker
  end

  def display_score
    puts ''
    puts "Current Score"
    print "#{human.name}: #{@@human_score}, "
    puts "#{computer.name}: #{@@computer_score}"
    puts ''
  end

  def no_match_winner?
    @@human_score < 5 && @@computer_score < 5
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, you must answer with 'y' or 'n'."
      puts
    end

    answer == 'y'
  end

  def display_play_again_message
    clear
    puts "Let's play again! (Press Enter to play again.)"
    gets
  end

  def display_goodbye_message
    clear
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end
end

game = TTTGame.new
game.play
