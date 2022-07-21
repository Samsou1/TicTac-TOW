require_relative 'board'

# This class deals with board display
class Render
  attr_accessor :display

  def initialize
    @display = render_board
  end

  def render_board
    board = Board.new.squares
    system('clear')
    puts "\n\n     |     |     "
    puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]}  "
    puts '     |     |     '
  end
end

Render.new.display
