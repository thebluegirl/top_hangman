require_relative "game.rb"

class Display
  attr_accessor :lives

  def initialize
    @game = Game.new
    @lives = 9
  end

  def player_feedback
    puts "Lives left: #{@lives}"
    unguessed_word_display(@game.word)
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