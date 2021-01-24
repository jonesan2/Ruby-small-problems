class Player
  def input_guess(range)
    guess = nil
    loop do
      print "Enter a number between #{range.min} and #{range.max}: "
      guess = gets.chomp
      break if guess.to_i.to_s == guess &&
               guess.to_i >= range.min &&
               guess.to_i <= range.max
      print "Invalid guess. "
    end
    guess.to_i
  end
end

class GuessingGame
  def initialize(low, high)
    @range = (low..high)
    @target = (low..high).to_a.sample
    @guesses = Math.log2(high - low).to_i + 1
    @player = Player.new
  end

  def report_on_guess(guess)
    case guess
    when (@range.min...@target)
      puts "Your guess is too low."
    when ((@target + 1)..@range.max)
      puts "Your guess is too high."
    when @target
      puts "That's the number!"
      puts
      puts "You won!"
    end
  end

  def play
    loop do
      break if @guesses <= 0
      puts "You have #{@guesses} guesses remaining."
      guess = @player.input_guess(@range)
      report_on_guess(guess)
      puts
      return if guess == @target
      @guesses -= 1
    end
    puts "You have no more guesses. You lost!"
  end
end

game = GuessingGame.new(100, 100000)
game.play
