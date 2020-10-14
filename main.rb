require_relative 'lib/board.rb'
require_relative 'lib/knight.rb'
require_relative 'lib/node.rb'

board = Board.new
board.knight_moves([3, 3], [0, 0])