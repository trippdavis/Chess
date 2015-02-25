require_relative 'piece.rb'

class Pawn < Piece
  def initialize(board, pos, color)
    super
    @intitial_pos = pos
  end

  def moves
    poss_moves = []
    dir_mul = (@color == :white ? 1 : -1)

    try = add_move_diff([0, 1 * dir_mul])
    if @board[*try].nil?
      poss_moves << try
      try = add_move_diff([0, 2 * dir_mul])
      if @board[*try].nil? && @initial_pos == @pos
        poss_moves << try
      end
    end

    try_captures = [[1, 1 * dir_mul], [-1, 1 * dir_mul]]
    try_captures.each do |diff|
      try = add_move_diff(diff)
      poss_moves << try if @board[*try] && @board[*try].color != @color
    end

    poss_moves
  end

  def to_pic
    "P"
  end
end
