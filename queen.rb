require_relative 'sliding_piece.rb'

class Queen < SlidingPiece
  MOVE_DIRECTIONS = [
    [1, 0],
    [1, 1],
    [0, 1],
    [-1, 1],
    [-1, 0],
    [-1, -1],
    [0, -1],
    [1, -1]
  ]

  def initialize(board, pos, color)
    super
  end

  def to_pic
    "Q"
  end

end
