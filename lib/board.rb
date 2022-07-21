require_relative 'board_square'
require_relative 'render'

# This class deals with managing the board
class Board
  attr_accessor :grid

  # creates a new board with in every board square, a number from 1 o 9
  def initialize
    @grid = []
    (1..9).each do |i|
      square = BoardSquare.new
      square.value = i
      @grid << square
    end
  end

  # check if the board if full of symbols or not
  def check_full?
    @grid.all? { |el| el.is_a?(String) } ? true : false
  end
end
