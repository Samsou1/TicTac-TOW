require_relative 'board'

# This class deals with single board squares
class BoardSquare
  attr_accessor :value, :allocated, :fill_circle, :fill_cross

  def initialize
    @value = nil
    @allocated = check_allocated
    @fill_circle = write_circle
    @fill_cross = write_cross
  end

  def check_allocated
    @value.is_a?(String) ? true : false
  end

  def write_circle
    @value = 'O'
  end

  def write_cross
    @value = 'X'
  end
end

puts BoardSquare.new.check_allocated
