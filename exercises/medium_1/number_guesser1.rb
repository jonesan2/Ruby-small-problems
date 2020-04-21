class GuessingGame
  def initialize
    @guesses = 7
    @range_min = 1
    @range_max = 100
    @target = (1..100).to_a.sample
  end

  def input_guess
    guess = nil
    loop do
      print "Enter a number between #{@range_min} and #{@range_max}: "
      guess = gets.chomp
      break if guess.to_i.to_s == guess &&
               guess.to_i >= @range_min &&
               guess.to_i <= @range_max
      print "Invalid guess. "
    end
    guess.to_i
  end

  def report_on_guess(guess)
    case guess
    when (@range_min...@target)
      puts "Your guess is too low."
    when ((@target + 1)..@range_max)
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
      guess = input_guess
      report_on_guess(guess)
      puts
      return if guess == @target
      @guesses -= 1
    end
    puts "You have no more guesses. You lost!"
  end
end

game = GuessingGame.new
game.play
