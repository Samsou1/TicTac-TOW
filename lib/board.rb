# This class deals with displaying the board
class Board
  attr_accessor :squares, :crosses, :circles

  def initialize
    @squares = (1..9).to_a
    @crosses = []
    @circles = []
  end
end

# print Board.new.squares
