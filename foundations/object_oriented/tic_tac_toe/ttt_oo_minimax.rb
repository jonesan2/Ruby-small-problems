class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  CORNERS = [1, 3, 7, 9]
  attr_accessor :squares

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |     "
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def dup
    dupboard = Board.new
    dupboard.squares = squares.map { |index, square| [index, square.dup] }.to_h
    dupboard
  end

  def new?
    unmarked_keys.size == 9
  end

  def last?
    unmarked_keys.size == 1
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def joinor
    array = unmarked_keys
    case array.size
    when 1 then array.join
    when 2 then array[0].to_s + ' or ' + array[1].to_s
    else
      array[0, array.size - 1].join(', ') + ', or ' + array[-1].to_s
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    winning_marker
  end

  def count_markers(squares)
    marks = squares.collect(&:marker).uniq
    marks.size == 1 && !marks.any?(Square::INITIAL_MARKER) ? marks.first : nil
  end

  def winning_marker
    WINNING_LINES.each do |line|
      if count_markers(@squares.values_at(*line))
        return count_markers(@squares.values_at(*line))
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

Player = Struct.new(:name, :marker, :score, :choice)

class TTTGame
  private

  COMPUTER_MARKER = "O"
  attr_reader :board, :human, :computer
  attr_accessor :current_marker

  def initialize
    @board = Board.new
    @human = Player.new('player 1', 'X')
    @computer = Player.new('computer', COMPUTER_MARKER)
  end

  def change_name(player)
    name = ''
    loop do
      puts "Enter #{player.name}'s name:"
      name = gets.chomp
      break unless name.strip.empty?
      puts "Name must include one character."
    end
    player.name = name
  end

  def change_marker
    answer = ''
    loop do
      puts "Pick any single character as your marker!"
      answer = gets.chomp
      break if answer.strip.size == 1 && answer != COMPUTER_MARKER
      puts "Not a valid marker."
    end
    human.marker = answer
  end

  def who_moves_first
    puts "Who should move first player or computer?"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ["player", "computer"].include?(answer)
      puts "Not a valid selection."
    end
    answer == "player" ? human.marker : COMPUTER_MARKER
  end

  def set_playfirst_marker
    @current_marker = who_moves_first
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear
    system('clear') || system('cls')
  end

  def display_board
    puts "#{human.name}: #{human.marker}"
    puts "#{computer.name}: #{computer.marker}"
    board.draw
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    square = nil
    puts "Choose a square: (#{board.joinor})"
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    return board[Board::CORNERS.sample] = computer.marker if board.new?
    minimax(board, @computer)
    board[computer.choice] = computer.marker
  end

  def switch(player)
    player.marker == human.marker ? @computer : @human
  end

  def minimax_score(state)
    case state.winning_marker
    when computer.marker then 1
    when human.marker then -1
    else 0
    end
  end

  def minimax(brd, player)
    return minimax_score(brd) if game_over?(brd)
    scores = {}

    brd.unmarked_keys.each do |square|
      possible_state = brd.dup
      possible_state[square] = player.marker
      scores[square] = minimax(possible_state, switch(player))
    end

    computer.choice, best_score = minormax(scores, player)

    best_score
  end

  def minormax(scores, player)
    if player.marker == computer.marker
      scores.max_by { |_, v| v }
    else
      scores.min_by { |_, v| v }
    end
  end

  def zero_scores
    human.score = 0
    computer.score = 0
  end

  def keep_scores
    case board.winning_marker
    when human.marker then human.score += 1
    when computer.marker then computer.score += 1
    end
  end

  def display_scores
    puts "#{human.name} has #{human.score} wins."
    puts "#{computer.name} has #{computer.score} wins."
  end

  def game_setup
    puts "Welcome to Tic Tac Toe!"
    puts ''
    change_name(human)
    change_name(computer)
    change_marker
    set_playfirst_marker
    zero_scores
    clear
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "Computer won!"
    else
      puts "It's a tie!"
    end
    display_scores
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_game
    board.reset
    clear
    set_playfirst_marker
    zero_scores
    display_play_again_message
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def game_over?(brd)
    brd.someone_won? || brd.full?
  end

  public

  # rubocop:disable Metrics/MethodLength

  def play
    game_setup

    loop do
      display_board

      loop do
        current_player_moves
        break if game_over?(board)
        clear_screen_and_display_board if human_turn?
      end
      display_result

      break unless play_again?
      reset_game
    end

    display_goodbye_message
  end
end

TTTGame.new.play
