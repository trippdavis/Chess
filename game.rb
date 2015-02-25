require_relative 'board.rb'
require_relative 'human_player.rb'


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

      begin
        start_pos = get_from_pos
        end_pos = get_to_pos
        @board.move(start_pos, end_pos)
      rescue MoveImpossible
        puts "final position invalid"
        retry
      rescue CheckError
        puts "can't move into check"
        retry
      rescue
        raise
      end

      switch_player
    end

    @board.display
    puts "#{@current_player.name} is in checkmate."
    switch_player
    puts "#{@current_player.name} wins!!"
  end

  def get_from_pos
    begin
      start_pos = @current_player.pick_from_pos
      check_start_pos(start_pos, @current_player.color)
    rescue ArgumentError
      puts "please enter two integers separated by a space"
      retry
    rescue OutOfBounds
      puts "that space is not on the board"
      retry
    rescue StartPosError
      puts "no piece of yours at start position"
      retry
    end

    start_pos
  end

  def get_to_pos
    begin
      end_pos = @current_player.pick_to_pos
      check_end_pos(end_pos)
    rescue ArgumentError
      puts "please enter two integers separated by a space"
      retry
    rescue OutOfBounds
      puts "that space is not on the board"
      retry
    end

    end_pos
  end

  def check_start_pos(start_pos, color)
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

class StartPosError < RuntimeError; end

if __FILE__ == $PROGRAM_NAME
  T = HumanPlayer.new("Tripp")
  J = HumanPlayer.new("Judy")
  game = Game.new(T, J)
  game.play
end
