require_relative "game.rb"

class Display
  def initialize
    
  end

  def unguessed_word_display(word)
    word.split("").each do |letter|
      print "__ "
    end
    puts ""
  end
end

game = Game.new
display = Display.new
display.unguessed_word_display(game.word)