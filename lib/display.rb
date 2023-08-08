require_relative "game.rb"

class Display
  def initialize
    @game = Game.new
  end

  def player_feedback
    puts "Lives left: #{@game.lives}"
    unguessed_word_display(@game.word)

    if !@game.wrong_guesses.empty?
      print @game.wrong_guesses
      print "\n"
    end
    @game.make_guess
    
    player_feedback
  end

  def unguessed_word_display(word)
    word.split("").each do |letter|
      print "__ "
    end
    puts ""
  end
end

display = Display.new
display.player_feedback