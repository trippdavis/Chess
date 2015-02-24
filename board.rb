require_relative 'require_all_pieces.rb'

class Board
  attr_reader :state

  def initialize
    @state = Array.new(8) { Array.new(8) }
    init_state
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

  def [](x, y)
    @state[x][y]
  end

  def []=(x, y, resident)
    @state[x][y] = resident
  end

  def display
    puts to_s
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

end

if __FILE__ == $PROGRAM_NAME
  a = Board.new
end
