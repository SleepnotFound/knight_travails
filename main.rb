# frozen_string_literal: true

require_relative 'knight'
require_relative 'chess_board'

game = ChessBoard.new
game.knight_moves([3, 3], [3, 3])
game.knight_moves([3, 3], [4, 3])
game.knight_moves([0, 0], [7, 7])
