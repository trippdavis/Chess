require_relative 'sliding_piece.rb'

class Bishop < SlidingPiece
  MOVE_DIRECTIONS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  def initialize(board, pos, color)
    super
  end

  def to_pic
    "B"
  end
end
