VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABBREVIATIONS = %w(r p sc l sp)
WINNING_COMBOS = { 'rock' => ['lizard', 'scissors'],
                   'paper' => ['spock', 'rock'],
                   'scissors' => ['paper', 'lizard'],
                   'lizard' => ['spock', 'paper'],
                   'spock' => ['rock', 'scissors'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert_abbreviation(abbrev)
  if VALID_ABBREVIATIONS.include?(abbrev)
    VALID_CHOICES[VALID_ABBREVIATIONS.find_index(abbrev)]
  else
    abbrev
  end
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

player_wins = 0
computer_wins = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("  Valid abbreviations: #{VALID_ABBREVIATIONS.join(', ')}")
    choice = Kernel.gets().chomp()

    choice = convert_abbreviation(choice)
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

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
