
class Game
  attr_reader :word
  attr_accessor :lives, :wrong_guesses

  def initialize
    @word = word_picker
    @lives = 9
    @wrong_guesses = Array.new
  end

  def word_picker
    word = File.open("/home/funto/repos/top_hangman/google-10000-english-no-swears.txt").readlines.sample.chomp
  
    if word.length >= 5 && word.length <= 12
      return word
    else
      word = word_picker
    end
  end

  def guess_check(letter)
    if word.split("").include?(letter)
      p "You guessed right!"
    else
      if @wrong_guesses.include?(letter)
        puts "You've already made this guess and it was wrong. Try again"
        letter = gets.chomp
        letter = guess_check(letter)
        return
      end
      @lives -= 1
      @wrong_guesses.push(letter)
      puts "Bad guess! :("
    end
  end
end

game = Game.new