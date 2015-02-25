require_relative 'sliding_piece.rb'

class Bishop < SlidingPiece
  #MOVE_DIRECTIONS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  def initialize(board, pos, color)
    super
    @move_directions = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def to_pic
    "B"
  end
end
