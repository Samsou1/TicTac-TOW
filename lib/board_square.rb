# This class deals with single board squares
class BoardSquare
  attr_accessor :value

  def initialize
    @value = nil
  end

  def check_allocated
    @value.is_a?(String) ? true : false
  end

  def write_cross
    @value = 'X'
  end

  def write_circle
    @value = 'O'
  end
end
