class Knight
  def get_moves(position)
    dx = [2, 2, -2, -2, 1, 1, -1, -1]
    dy = [1, -1, 1, -1, 2, -2, 2, -2]

    moves = []
    
    8.times do |i|
      moves << [position[0] + dx[i], position[1] + dy[i]]
    end
    
    moves.reject! { |p| p.any? {|i| i < 0 || i > 7 } }

    moves
  end
end