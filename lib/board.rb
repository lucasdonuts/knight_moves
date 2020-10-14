#It's a start. currently counting all moves instead of best ones.

class Board
  def initialize
    @knight = Knight.new
  end

  def knight_moves(start, finish)
    # Checking whether start and end are inside board
    if !valid_coords?(start)
      puts "Start position invalid."
    elsif !valid_coords?(finish)
      puts "Destination invalid."
    end

    start = Node.new(start)

    visited = []
    queue = [start]
    path = []

    while queue.size > 0
      current = queue.shift
      visited << current

      if current.coords == finish
        path = create_path(start, current)
        puts "You made it in #{path.length - 1} moves!"
        puts "Here's your path:"
        path.each do |move|
          p move
        end
        return
      end

      next_moves = @knight.get_moves(current.coords)
      next_moves.each do |move|
        move = Node.new(move, current)
        queue << move unless visited.include?(move)
      end
    end
  end

  def create_path(start, node)
    path = []
    current = node
    while current.parent
      path.unshift(current.coords)
      current = current.parent
    end
    path.unshift(start.coords)
    path
  end
  
  def valid_coords?(coords)
    if coords.any? {|i| i < 0 || i > 7 }
      return false
    else
      return true
    end
  end
end

