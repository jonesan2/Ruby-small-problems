# the Hash#values_at method and the splat operator are introduced in
# the detect_winner method
#
# MINIMAX ALGORITHM
# 1) Test all empty squares
# 2) For each square, return a minimax value
# 3) Play on the square with the smallest minimax value
#
# minimax examples
#
# 1) Winning move: -1
# 2) Opponent winning move: 1
# 3) One path with an option for opponent win, another path without one:
#        return 1 for the first path, 0 for the second path.

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_PLAYER = 'choose'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
MARKERS = { 'Player' => PLAYER_MARKER, 'Computer' => COMPUTER_MARKER }

def prompt(msg)
  puts " => #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER.to_s }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, scr)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "Current score:  Player #{scr['Player']}, Computer #{scr['Computer']}"
  puts ''
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----------------'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----------------'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def joinor(list, punct = ', ', conj = 'or')
  case list.size
  when 0 then ''
  when 1 then list[0]
  when 2 then "#{list[0]} #{conj} #{list[1]}"
  else
    list[-1] = "#{conj} #{list.last}"
    list.join(punct)
  end
end

def choose_first_player
  loop do
    prompt 'Who should play first? Choose Player (P) or Computer (C):'
    plr = gets.chomp
    case plr.downcase.chr
    when 'p' then return 'Player'
    when 'c' then return 'Computer'
    else prompt "Sorry, that entry is invalid."
    end
  end
end

def set_first_player
  FIRST_PLAYER == 'choose' ? choose_first_player : FIRST_PLAYER
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARKER.to_s }
end

def player_places_piece!(brd)
  square = 0
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # win_square = find_win_or_block(brd, COMPUTER_MARKER)
  # block_square = find_win_or_block(brd, PLAYER_MARKER)

  # square = win_square
  # square ||= block_square
  # square ||= 5 if empty_squares(brd).include?(5)
  # square ||= empty_squares(brd).sample

  square = find_play_square(brd, 'Computer')[0]

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, plr)
  player_places_piece!(brd) if plr == 'Player'
  computer_places_piece!(brd) if plr == 'Computer'
end

def alternate_player(plr)
  plr == 'Player' ? 'Computer' : 'Player'
end

def find_play_square(brd, plr)
  play_here = 0
  best_value = 1

  empty_squares(brd).each do |square|
    current_minimax = find_minimax(brd, square, plr)
    if current_minimax <= best_value
      best_value = current_minimax
      play_here = square
    end
  end

  [play_here, best_value]
end

def find_minimax(brd, sqr, plr)
  brd[sqr] = MARKERS[plr]

  if check_win?(brd, plr)
    minimax = -1
  elsif empty_squares(brd) == []
    minimax = 0
  else
    minimax = -1 * find_play_square(brd, alternate_player(plr))[1]
    # check all possible moves on the next turn
    # if any of those moves are winning moves for the player, return -1
    # if the board is full for that move and no winner, return 0
    # for moves that aren't winning moves, check all possible moves on next turn
    # invert the value of minimax since it was calculated for the opponent
    # minimax is the smallest possible return value from all of those moves
  end

  brd[sqr] = INITIAL_MARKER
  minimax
end

def check_win?(brd, plr)
  WINNING_LINES.any? { |line| brd.values_at(*line).count(MARKERS[plr]) == 3 }
end

def find_win_or_block(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      play_here = line.select { |box| empty_squares(brd).include?(box) }.first
      return play_here unless play_here.nil?
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

score = { 'Player' => 0, 'Computer' => 0 }
loop do
  board = initialize_board
  current_player = set_first_player

  loop do
    display_board(board, score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if board_full?(board) || someone_won?(board)
  end

  if someone_won?(board)
    score[detect_winner(board)] += 1
    display_board(board, score)
    prompt "#{detect_winner(board)} won!"
    if score['Player'] >= 5
      prompt "Player wins the match #{score['Player']}-#{score['Computer']}"
      break
    elsif score['Computer'] >= 5
      prompt "Computer wins the match #{score['Computer']}-#{score['Player']}"
      break
    end
  else
    display_board(board, score)
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
