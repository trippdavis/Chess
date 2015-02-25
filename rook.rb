require_relative 'sliding_piece.rb'

class Rook < SlidingPiece
  MOVE_DIRECTIONS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def initialize(board, pos, color)
    super
  end

  def to_pic
    "R"
  end
end
