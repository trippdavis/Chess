require_relative 'stepping_piece.rb'

class King < SteppingPiece
  MOVE_DIFFS = [
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
    "K"
  end
end
