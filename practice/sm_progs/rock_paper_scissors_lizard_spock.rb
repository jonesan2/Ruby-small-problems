VALID_CHOICES = [['rock', 'r'],
                 ['paper', 'p'],
                 ['scissors', 'sc'],
                 ['lizard', 'l'],
                 ['spock', 'sp']]
WINNING_COMBOS = { 'rock' => ['lizard', 'scissors'],
                   'paper' => ['spock', 'rock'],
                   'scissors' => ['paper', 'lizard'],
                   'lizard' => ['spock', 'paper'],
                   'spock' => ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def list_options
  result = ''
  VALID_CHOICES.each { |set| result << set[0] + ' (' + set[1] + '), ' }
  result = result.slice(0..-3) # Cut off the final comma
end

def convert_abbreviation(choice)
  VALID_CHOICES.each { |set| return set[0] if set[1] == choice }
  choice
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

player_wins = 0
computer_wins = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{list_options}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.flatten.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  choice = convert_abbreviation(choice)

  computer_choice = VALID_CHOICES.sample[0]

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  if win?(choice, computer_choice)
    prompt("You won!")
    player_wins += 1
  elsif win?(computer_choice, choice)
    prompt("Computer won!")
    computer_wins += 1
  else
    prompt("It's a tie!")
  end

  if player_wins == 5
    prompt("Player wins by a score of #{player_wins} to #{computer_wins}!")
    break
  elsif computer_wins == 5
    prompt("Computer wins by a score of #{computer_wins} to #{player_wins}!")
    break
  else
    prompt("Score:  Player - #{player_wins}, Computer - #{computer_wins}")
  end
end

prompt("Thank you for playing. Goodbye!")
