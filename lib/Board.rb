class Board
  attr_reader :cases

  def initialize
    @cases = Array.new(9) { BoardCase.new }
  end

  def play(position, symbol)
    @cases[position].value = symbol
  end

  def is_full?
    @cases.all? { |board_case| board_case.value != " " }
  end

  def reset
    @cases.each { |board_case| board_case.value = " " }
  end

end