
class Game
  attr_reader :word
  attr_accessor :lives, :wrong_guesses, :word_letters

  def initialize
    @word = word_picker
    @lives = 9
    @wrong_guesses = Array.new
    @word_letters = Array.new
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
      if @word_letters.include?(letter)
        puts "You've already guessed this letter. Please make another guess"
        letter = make_guess
        return
      end
      p "You guessed right!"
      @word_letters.push(letter)
    else
      if @wrong_guesses.include?(letter)
        puts "You've already made this guess and it was wrong. Try again"
        letter = make_guess
        return
      end
      @lives -= 1
      @wrong_guesses.push(letter)
      puts "Bad guess!"
    end
  end

  def game_over?
    if @lives == 0
      return true
    else
      return false
    end
  end
end
