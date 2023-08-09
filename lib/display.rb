require_relative "game.rb"

class Display
  def initialize
    @game = Game.new
  end

  def gameplay
    until @game.game_over?
      player_feedback
      game_lost
    end
  end

  def player_feedback
    puts "Lives left: #{@game.lives}"
    unguessed_word_display(@game.word)
    if !@game.wrong_guesses.empty?
      print "Bad guesses: "
      print @game.wrong_guesses
      print "\n"
    end
    puts "What is the word? Guess one of the letters in it"

    @game.make_guess
    puts ""
  end

  def unguessed_word_display(word)
    word.split("").each do |letter|
      if @game.word_letters.include?(letter)
        print "#{letter} "
      else
        print "__ "
      end
    end
    puts ""
  end

  def game_lost
    if @game.game_over? && @game.lives == 0
      puts "You lose :("
      puts "The word was '#{@game.word}'"
    end
  end
end

display = Display.new
display.gameplay