require_relative 'board_square'

# This class deals with managing the board
class Board
  attr_accessor :squares, :crosses, :circles, :full

  def initialize
    @squares = []
    9.times { @squares << BoardSquare.new }
    @crosses = []
    9.times { @crosses << nil }
    @circles = []
    9.times { @circles << nil }
    @full = check_full?
  end

  def check_full?
    @squares.all? { |el| el.is_a?(String) } ? true : false
  end
end
