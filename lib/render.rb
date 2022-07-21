# This class deals with board rendering
class Render

  def render_board(grid)
    puts "\n\n     |     |     "
    puts "  #{grid[0].value}  |  #{grid[1].value}  |  #{grid[2].value}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{grid[3].value}  |  #{grid[4].value}  |  #{grid[5].value}  "
    puts '_____|_____|_____'
    puts '     |     |     '
    puts "  #{grid[6].value}  |  #{grid[7].value}  |  #{grid[8].value}  "
    puts '     |     |     '
  end
end

# Render.new.board
