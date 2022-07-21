require_relative 'player'
require_relative 'board'

# This i the main game loop
class Game
  attr_accessor :player1, :player2, :board, :render

  def initialize(name1, name2)
    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
    @board = Board.new
    @render = Render.new
    play
  end

  def check_if_win
    winning_combination = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]
    winning_combination.each do |ary|
      winning_element_for_x = 0
      winning_element_for_o = 0
      ary.length.times do |index|
        if @board.grid[ary[index] - 1].value == 'X'
          winning_element_for_x += 1
          return [true, 'x'] if winning_element_for_x == 3
        elsif @board.grid[ary[index] - 1].value == 'O'
          winning_element_for_o += 1
          return [true, 'o'] if winning_element_for_o == 3
        end
      end
    end
    [false, '']
  end

  def play
    while !check_if_win[0] && !check_if_draw
      puts "It's #{@player1.name}'s turn to play, where do you want to place your symbol?"
      play_by_turn(1)
      next unless !check_if_win[0] && !check_if_draw


    end
    puts 'The game is finished'
    @render.render_board(@board.grid)
  end

  def play_by_turn(int)
    if int == 1
      @render.render_board(@board.grid)
        desired_play = gets.to_i
        while legal_move?(desired_play) == false
          puts 'This is not possible, can you give me another move?'
          @render.render_board(@board.grid)
          desired_play = gets.to_i
        end
        @board.grid[desired_play - 1].write_cross
      elsif int == 2
        puts "It's now #{@player2.name}'s turn to play, where do you want to place your symbol?"
        @render.render_board(@board.grid)
        desired_play = gets.to_i
        while legal_move?(desired_play) == false
          puts 'This is not possible, can you give me another move?'
          @render.render_board(@board.grid)
          desired_play = gets.to_i
        end
        @board.grid[desired_play - 1].write_circle
      else
        puts "oulah problem"
      end
    end
  end

  def legal_move?(str)
    str = str.to_i
    (str >= 1 && str <= 9) && @board.grid[str - 1].value.is_a?(Integer) ? true : false
  end

  def check_if_draw
    !check_if_win[0] && @board.check_full? ? true : false
  end

end
