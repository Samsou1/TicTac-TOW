require_relative 'player'
require_relative 'board'

# This i the main game loop
class Game
  attr_accessor :player1, :player2, :board

  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @board = Board.new
    middle_game

  end

  def middle_game
    while !check_if_win && !check_if_draw
      puts "It's #{@player1}'s turn to play, where do you want to place your symbol?"
      desired_play = gets.chomp
      while legal_move?(desired_play) == false
        "This is not possible, can you give me another move?"
        desired_play = gets.chomp
      end
      if !check_if_win && !check_if_draw
        puts "It's now #{@player2}'s turn to play, where do you want to place your symbol?"
        desired_play = gets.chomp
        while legal_move?(desired_play) == false
          "This is not possible, can you give me another move?"
          desired_play = gets.chomp
        end
      end
    end
    puts "The game is finished"
  end

  def legal_move?(str)
    str = str.to_i
    return false unless (str >= 1 && str <= 9) || @board[str - 1].class != Integer

    true
  end

  def check_if_win
    winning_combination = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]
    winning_combination.each do |ary|
      winning_element_for_x =0
      winning_element_for_o = 0
      ary.length.times do |index|
        if  @board.crosses[ary[index]-1] == 'X'
          winning_element_for_x += 1
          return [true,'x'] if winning_element_for_x == 3
        elsif @board.circles[ary[index]-1] == 'O'
          winning_element_for_o += 1
          return [true,'o'] if winning_element_for_o == 3
        end
      end
    end
    [false,'']
  end

  def check_if_draw
    return true if !check_if_win[0] && @board.full
    false
  end

end
