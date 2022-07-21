require_relative 'board_square'
require_relative 'render'

# This class deals with managing the board
class Board
  attr_accessor :grid

  def initialize
    @grid = []
    (1..9).each do |i|
      square = BoardSquare.new
      square.value = i
      @grid << square
    end
  end

  def check_full?
    @grid.all? { |el| el.is_a?(String) } ? true : false
  end
end
