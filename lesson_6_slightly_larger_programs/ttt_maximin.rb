# Tic-Tac-Toe with Minimax
#   (the computer is unbeatable)
#
# the Hash#values_at method and the splat operator are used in
#   the detect_winner method
#
# MINIMAX ALGORITHM
# 1) Test all empty squares
# 2) For each square, return a minimax value
# 3) Play on the square with the smallest minimax value
#
# minimax examples
# 1) Winning move: -1
# 2) Opponent winning move: 1
# 3) One path with an option for opponent win, another path without one:
#        return 1 for the first path, 0 for the second path.

FIRST_PLAYER = 'choose'
MARKERS = { Player: 'X', Computer: 'O', Initial: ' ' }
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts " => #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = MARKERS[:Initial] }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, scr)
  system 'clear'
  puts "You're a #{MARKERS[:Player]}. Computer is #{MARKERS[:Computer]}"
  puts "Current score:  Player #{scr[:Player]}, Computer #{scr[:Computer]}"
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
    prompt 'Who should play first? Choose (P)layer or (C)omputer:'
    plr = gets.chomp
    case plr.downcase.chr
    when 'p' then return :Player
    when 'c' then return :Computer
    else prompt "Sorry, that entry is invalid."
    end
  end
end

def set_first_player
  FIRST_PLAYER == 'choose' ? choose_first_player : FIRST_PLAYER
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == MARKERS[:Initial] }
end

def player_places_piece!(brd)
  square = 0
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = MARKERS[:Player]
end

def computer_places_piece!(brd)
  square = find_play_square(brd, :Computer)[0]
  brd[square] = MARKERS[:Computer]
end

def place_piece!(brd, plr)
  player_places_piece!(brd) if plr == :Player
  computer_places_piece!(brd) if plr == :Computer
end

def alternate_player(plr)
  plr == :Player ? :Computer : :Player
end

def find_play_square(brd, plr)
  play_here = 0
  best_value = 1

  if empty_squares(brd).length == 9
    play_here = 5
  else
    empty_squares(brd).each do |square|
      current_minimax = find_minimax(brd, square, plr)
      if current_minimax <= best_value
        best_value = current_minimax
        play_here = square
      end
    end
  end

  [play_here, best_value]
end

def find_minimax(brd, sqr, plr)
  brd[sqr] = MARKERS[plr]

  minimax = if check_win?(brd, plr)
              -1
            elsif empty_squares(brd) == []
              0
            else
              -0.5 * find_play_square(brd, alternate_player(plr))[1]
            end

  brd[sqr] = MARKERS[:Initial]
  minimax
end

def check_win?(brd, plr)
  WINNING_LINES.any? do |line|
    brd.values_at(*line).count(MARKERS[plr]) == 3
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(MARKERS[:Player]) == 3
      return :Player
    elsif brd.values_at(*line).count(MARKERS[:Computer]) == 3
      return :Computer
    end
  end
  nil
end

def display_game_end(brd, scr)
  display_board(brd, scr)
  if someone_won?(brd)
    scr[detect_winner(brd)] += 1
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
  prompt("Current score:")
  prompt("Player: #{scr[:Player]}, Computer #{scr[:Computer]}")
end

def display_match_end(scr)
  prompt("Final score:")
  prompt("Player: #{scr[:Player]}, Computer #{scr[:Computer]}")
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y') ? true : false
end

score = { Player: 0, Computer: 0 }
loop do
  board = initialize_board
  current_player = set_first_player

  loop do
    display_board(board, score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if board_full?(board) || someone_won?(board)
  end

  break if score.values.include?(5)
  display_game_end(board, score)
  break unless play_again?
end

display_match_end(score)
prompt "Thanks for playing Tic Tac Toe! Good bye!"
