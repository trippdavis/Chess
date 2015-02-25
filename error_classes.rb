class OutOfBounds < RuntimeError
  def initialize(msg = "That space is not on the board")
    super(msg)
  end
end

class MoveImpossible < RuntimeError
  def initialize(msg = "That move is illegal")
    super(msg)
  end
end

class CheckError < RuntimeError
  def initialize(msg = "You can't move into check")
    super(msg)
  end
end

class StartPosError < RuntimeError
  def initialize(msg = "You don't have a piece there")
    super(msg)
  end
end

class ArgumentError
  def message
    "Enter two integers separated by a space"
  end
end
