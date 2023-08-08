
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

  def make_guess
    letter = gets.downcase.chomp

    if letter.length != 1 || letter.match(/\W/)
      puts "This is not a valid guess. Please make a valid guess of one letter"
      letter = make_guess
      return
    end

    if word.split("").include?(letter)
      p "You guessed right!"
      return letter
    else
      if @wrong_guesses.include?(letter)
        puts "You've already made this guess and it was wrong. Try again"
        letter = make_guess(letter)
        return
      end
      @lives -= 1
      @wrong_guesses.push(letter)
      puts "Bad guess! :("
    end
  end
end

game = Game.new