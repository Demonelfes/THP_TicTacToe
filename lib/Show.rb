class Show
  def self.display_board(board)
    puts "╔═══╦═══╦═══╗"
    puts "║ #{board.cases[0].value.colorize(get_color(board.cases[0].value))} ║ #{board.cases[1].value.colorize(get_color(board.cases[1].value))} ║ #{board.cases[2].value.colorize(get_color(board.cases[2].value))} ║"
    puts "╠═══╬═══╬═══╣"
    puts "║ #{board.cases[3].value.colorize(get_color(board.cases[3].value))} ║ #{board.cases[4].value.colorize(get_color(board.cases[4].value))} ║ #{board.cases[5].value.colorize(get_color(board.cases[5].value))} ║"
    puts "╠═══╬═══╬═══╣"
    puts "║ #{board.cases[6].value.colorize(get_color(board.cases[6].value))} ║ #{board.cases[7].value.colorize(get_color(board.cases[7].value))} ║ #{board.cases[8].value.colorize(get_color(board.cases[8].value))} ║"
    puts "╚═══╩═══╩═══╝"
  end

  def self.get_color(value)
    case value
    when "X"
      :red
    when "O"
      :blue
    else
      :white
    end
  end
end
