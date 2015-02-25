class HumanPlayer
  def initialize(name)
    @name = name
  end

  def play_turn

    begin
      puts "#{@name}, what space would you like to move from? (e.g. 0 0)"
      from_pos = gets.chomp.split
    rescue
      raise
    end

    begin
      puts "#{@name}, what space would you like to move to?"
      to_pos = gets.chomp.split
    rescue
      raise
    end

    [from_pos, to_pos]
  end
end
