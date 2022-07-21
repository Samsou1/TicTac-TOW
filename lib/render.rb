require_relative 'board'

# This class deals with board rendering
class Render
  attr_accessor :board

  def initialize
    @board = render_board
  end

  def render_board
    grid = Board.new.squares
    system('clear')
    puts "\n\n     |     |     "
    puts "  #{grid[0]}  |  #{grid[1]}  |  #{grid[2]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{grid[3]}  |  #{grid[4]}  |  #{grid[5]}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{grid[6]}  |  #{grid[7]}  |  #{grid[8]}  "
    puts '     |     |     '
  end
end

# Render.new.board
