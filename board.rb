require_relative 'require_all_pieces.rb'

require 'byebug'

class Board
  attr_accessor :state

  def initialize
    @state = Array.new(8) { Array.new(8) }
    init_state
  end

  def move(start_pos, end_pos)
    raise OutOfBounds unless start_pos.all? { |i| (0..7).include?(i) }
    piece = self[*start_pos]

    raise MoveImpossible unless piece.moves.include?(end_pos)
    raise CheckError unless piece.valid_moves.include?(end_pos)
    captured_piece = self[*end_pos]
    captured_piece.pos = nil if captured_piece

    self[*end_pos] = piece
    piece.pos = end_pos
    self[*start_pos] = nil

  end

  def move!(start_pos, end_pos)
    piece = self[*start_pos]
    self[*end_pos] = piece
    piece.pos = end_pos
    self[*start_pos] = nil
  end

  def in_check?(color)
    in_check = false

    king = pieces_of_color(color).find { |piece| piece.class == King }
    king_pos = king.pos

    @state.flatten.each do |square|
      if square && square.color != color
        in_check = true if square.moves.include?(king_pos)
      end
    end

    in_check
  end

  def checkmate?(color)
    @state.flatten.compact.none? do |square|
      square.color == color && square.valid_moves.length > 0
    end
  end

  def [](x, y)
    @state[x][y]
  end

  def []=(x, y, resident)
    @state[x][y] = resident
  end

  def display
    puts to_s
  end

  def deep_dup
    board_dup = self.dup

    board_dup.state = @state.dup
    @state.each_with_index do |row, i|
      board_dup.state[i] = row.dup
      row.each_with_index do |square, j|
        board_dup[i,j] = square.dup if square
      end
    end

    board_dup.state.flatten.compact.each do |square|
      square.board = board_dup
    end

    board_dup
  end

  private

  def each_piece(&prc)
    @state.flatten.compact.each do |piece|
      prc.call(piece)
    end
  end

  def pieces_of_color(color)
    @state.flatten.compact.select do |piece|
      piece.color == color
    end
  end

  def to_s
    to_show = ""

    @state.each do |row|
      row.each do |square|
        to_show << (square.nil? ? nil_display : square.display)
      end
      to_show << "\n"
    end

    to_show
  end

  def nil_display
    " "
  end

  def init_state
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    back_row.each_with_index do |piece_class, i|
      self[0, i] = piece_class.new(self, [0, i], :black)
    end

    back_row.each_with_index do |piece_class, i|
      self[7, i] = piece_class.new(self, [7, i], :white)
    end

    (0..7).each do | i|
      self[1, i] = Pawn.new(self, [1, i], :black)
    end

    (0..7).each do | i|
      self[6, i] = Pawn.new(self, [6, i], :white)
    end
  end
end

class OutOfBounds < RuntimeError; end
class MoveImpossible < RuntimeError; end
class CheckError < RuntimeError; end
