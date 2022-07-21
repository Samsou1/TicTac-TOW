require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

puts "Welcome to Tictac TOE!"
puts "Player 1, what's your name?"
name_1 = gets.chomp
puts "That's a great name #{name_1}, how about you Player 2?"
name_2 = gets.chomp
puts "Welcome to both of you #{name_1} and #{name_2}"
puts "I'm sure you all know this game but just so we're clear, here are the rules again"
puts "Here is a board of 9 squares that are empty for now"
puts "You will place your symbol, either a 'X' or a 'O' on each square"
puts "In order to win the game, you need to place 3 of your symbol on the same row, column or diagonal"
puts "If all 9 squares are filled and there's no winner then it's a draw"
puts "Shall we?"
wanna_play = true
number_of_win_play_1 = 0
number_of_win_play_2 = 0
number_of_draws = 0
while wanna_play = true
  game = Game.new(name_1, name_2)
  number_of_win_play_1 += 1 if game.result == "#{name_1} wins!"
  number_of_win_play_2 += 1 if game.result == "#{name_2} wins!"
  number_of_draws += 1 if game.result == "Aww it's a draw, nobody wins"
  puts "#{name1} won #{number_of_win_play_1} times"
  puts "#{name2} won #{number_of_win_play_2} times"
  puts "There has been #{number_of draws} draws"
  puts "\n#{name1} is leading by #{number_of_win_play_1 - number_of_win_play_2} points" if number_of_win_play_1 > number_of_win_play_2
  puts "#{name2} is leading by #{number_of_win_play_2 - number_of_win_play_1} points" if number_of_win_play_2 > number_of_win_play_1
  puts "It's a tight race, you both have the same number of points " if number_of_win_play_2 == number_of_win_play_1
  puts "\nDo you wanna play another game?"
  acceptable_response = false
  while acceptable_response == false
    response = gets.chomp
    if response.downcase == "n" || response.downcase == "no" || response.downcase == "nah" || response.downcase == "nope"
      wanna_play = false
      acceptable_response = true
      puts "Ok, see you another time!"
    elsif response.downcase == "y" || response.downcase == "yes" || response.downcase == "yeah" || response.downcase == "yep"
      wanna_play = true
      puts "Awesome let's keep playing!"
      acceptable_response = true
    else
      puts "Sorry, I didn't catch that, do you wanna keep playing?"
    end
  end
end
