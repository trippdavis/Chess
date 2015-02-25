class HumanPlayer
  attr_accessor :color
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def pick_from_pos
    puts "#{@name}, what space would you like to move from? (e.g. 0 0)"
    from_pos = gets.chomp.split.map{ |el| Integer(el) }
  end

  def pick_to_pos
    puts "#{@name}, what space would you like to move to?"
    to_pos = gets.chomp.split.map{ |el| Integer(el) }
  end
end
