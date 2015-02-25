require_relative 'stepping_piece.rb'

class Knight < SteppingPiece
  MOVE_DIFFS = [
    [1, 2],
    [-1, 2],
    [-1, -2],
    [1, -2],
    [-2, 1],
    [-2, -1],
    [2, -1],
    [2, 1]
  ]

  
  def initialize(board, pos, color)
    super
  end


  def to_pic
    "N"
  end


end
