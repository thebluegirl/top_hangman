require_relative "game.rb"
require 'yaml'

class GamePlay
  def initialize
    @game = load_game
  end

  def start
    until @game.game_over?
      player_feedback
    end

    if @game.game_won
      win_feedback
    elsif @game.lives == 0
      lose_feedback
    end
  end

  def player_feedback
    puts "Lives left: #{@game.lives}"
    unguessed_word_display(@game.word)
    if !@game.wrong_guesses.empty?
      print "Bad guesses: "
      @game.wrong_guesses.each do |letter|
        if letter == @game.wrong_guesses.last
          print "#{letter}"
        else
          print "#{letter}, "
        end
      end
      print "\n"
    end
    puts "What is the word? Guess one of the letters in it or type 'save' to save this game"
    
    if @game.make_guess == "save"
      save_game(@game)
    end
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

  def lose_feedback
    if @game.game_over? && @game.lives == 0
      puts "You lose :("
      puts "The word was '#{@game.word}'"
    end
  end

  def win_feedback
    puts "You guessed the word '#{@game.word}'!"
    puts "You win!"
  end

  def save_game(variable)
    File.open("saved_gameplay.yml", "w") {|file| file.write(variable.to_yaml)}
    exit
  end

  def load_game
    if File.exists?("saved_gameplay.yml")
      puts "You have a saved game."
      puts "Type 'continue' to resume your last game or type 'new' to start a new game."
      puts "Note that starting a new game means you will permanently lose your saved game"
      game_type = gets.chomp.rstrip.downcase

      if game_type == "continue"
        game = YAML::load_file("saved_gameplay.yml", permitted_classes:[Game])
        File.delete("saved_gameplay.yml")
        return game
      elsif game_type == "new"
        File.delete("saved_gameplay.yml")
        return Game.new
      else
        puts "This is not a valid option. Please enter either 'continue' or 'new'."
        load_game
        return
      end
    else
      return Game.new
    end
  end
end

game_play = GamePlay.new
game_play.start