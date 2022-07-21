require_relative '../game'
require_relative '../player'

# This class performs the game loop
class Application
  attr_accessor :name1, :name2, :game_won1, :game_won2, :game_drawn

  def initialize
    @name1 = ''
    @name2 = ''
    @game_won1 = 0
    @game_won2 = 0
    @game_drawn = 0
    screen_clear
    prompt_welcome
    prompt_name
    prompt_rules
    game_loop
  end

  def screen_clear
    system('clear')
  end

  def prompt_welcome
    puts "\n\nWelcome to Tictac TOE!"
  end

  def prompt_name
    puts "\nPlayer 1, what's your name?"
    @name1 = gets.chomp
    puts "That's a great name #{name1}, how about you Player 2?"
    @name2 = gets.chomp
    puts "Welcome to both of you #{name1} and #{name2}"
  end

  def prompt_rules
    puts "\nI'm sure you all know this game but just so we're clear, here are the rules again"
    puts 'Here is a board of 9 squares that are empty for now'
    puts "You will place your symbol, either a 'X' or a 'O' on each square"
    puts 'In order to win the game, you need to place 3 of your symbol on the same row, column or diagonal'
    puts "If all 9 squares are filled and there's no winner then it's a draw"
    puts 'Shall we?'
  end

  def display_stats
    puts "#{@name1} won #{game_won1} times"
    puts "#{@name2} won #{game_won2} times"
    puts "There has been #{game_drawn} draws"
    if game_won1 > game_won2
      puts "\n#{@name1} is leading by #{@game_won1 - @game_won2} points"
    elsif game_won2 > game_won1
      puts "#{@name2} is leading by #{@game_won2 - @game_won1} points"
    else
      puts "It's a tight race, you both have the same number of points " if @game_won2 == @game_won1
      puts "\nDo you wanna play another game?"
    end
  end

  def keep_playing?
    acceptable_response = false
    while acceptable_response == false
      response = gets.chomp
      if response.downcase == 'n' || response.downcase == 'no' || response.downcase == 'nah' || response.downcase == 'nope'
        puts 'Ok, see you another time!'
        return false
      elsif response.downcase == 'y' || response.downcase == 'yes' || response.downcase == 'yeah' || response.downcase == 'yep'
        puts "Awesome let's keep playing!"
        return true
      else
        puts "Sorry, I didn't catch that, do you wanna keep playing?"
      end
    end
  end

  def game_loop
    wanna_play = true
    while wanna_play == true
      game = Game.new(@name1, @name2)
      @game_won1 += 1 if game.check_if_win[1] == 'X'
      @game_won2 += 1 if game.check_if_win[1] == 'O'
      @game_drawn += 1 if game.check_if_draw == true
      display_stats
      wanna_play = keep_playing?
    end
  end
end

Application.new
