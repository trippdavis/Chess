require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'error_classes.rb'


class Game
  def initialize(white, black)
    @white = white
    @white.color = :white
    @black = black
    @black.color = :black
    @current_player = white
    @board = Board.new
  end

  def play
    puts "It's on! Place your bets now."

    until won?
      @board.display
      make_move
      switch_player
    end

    @board.display
    puts "#{@current_player.name} is in checkmate."
    switch_player
    puts "#{@current_player.name} wins!!"
  end

  private

  def make_move
    start_pos = get_from_pos
    end_pos = get_to_pos
    @board.move(start_pos, end_pos)

    rescue MoveImpossible, CheckError => e
      puts e.message
      retry
  end

  def get_from_pos
    begin
      start_pos = @current_player.pick_from_pos
      check_start_pos(start_pos, @current_player.color)
    rescue ArgumentError, OutOfBounds, StartPosError => e
      puts e.message
      retry
    end

    start_pos
  end

  def get_to_pos
    begin
      end_pos = @current_player.pick_to_pos
      check_end_pos(end_pos)
    rescue ArgumentError, OutOfBounds => e
      puts e.message
      retry
    end

    end_pos
  end

  def check_start_pos(start_pos, color) # http://stackoverflow.com/questions/3382866/rubys-exception-error-classes
    raise OutOfBounds unless start_pos.all? { |i| (0..7).include?(i) }
    piece = @board[*start_pos]
    raise StartPosError if piece.nil? || piece.color != color
  end

  def check_end_pos(end_pos)
    raise OutOfBounds unless end_pos.all? { |i| (0..7).include?(i) }
  end

  def won?
    [:white, :black].any?{ |col| @board.checkmate?(col) }
  end

  def switch_player
    @current_player = (@current_player == @white ? @black : @white)
  end
end

if __FILE__ == $PROGRAM_NAME
  T = HumanPlayer.new("Tripp")
  J = HumanPlayer.new("Judy")
  game = Game.new(T, J)
  game.play
end
