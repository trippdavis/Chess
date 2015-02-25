require_relative 'board.rb'
require_relative 'human_player.rb'


class Game
  def initialize(white, black)
    @white = white
    @black = black
    @current_player = white
    @board = Board.new
  end

  def play
    puts "It's on! Place your bets now."


    until won?
      @board.display
      begin
        start_pos, end_pos = @current_player.play_turn
        @board.move(start_pos, end_pos)
      rescue

      end
      switch_player
    end
  end

  def won?
    [:white, :black].any?{ |col| @board.checkmate?(col) }
  end

  def switch_player
    @current_player = (@current_player == :white ? :black : :white)
  end

end

if __FILE__ == $PROGRAM_NAME
  T = HumanPlayer.new("Tripp")
  J = HumanPlayer.new("Judy")
  game = Game.new(T, J)
  game.play
end
