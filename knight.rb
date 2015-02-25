require_relative 'stepping_piece.rb'

class Knight < SteppingPiece

  def initialize(board, pos, color)
    super
    @move_diffs = [
      [1, 2],
      [-1, 2],
      [-1, -2],
      [1, -2],
      [-2, 1],
      [-2, -1],
      [2, -1],
      [2, 1]
    ]
  end


  def to_pic
    "N"
  end


end
