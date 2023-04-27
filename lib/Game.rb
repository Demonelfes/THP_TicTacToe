require_relative "Show.rb"
class Game
  attr_accessor :current_player, :status
  attr_reader :player1, :player2, :board

  def initialize
    puts "Joueur1 présente toi : ".yellow
    print ">"
    @player1 = Player.new(gets.chomp, "X")
    puts "Joueur2 présente toi : ".yellow
    print ">"
    @player2 = Player.new(gets.chomp, "O")
    @board = Board.new
    @current_player = @player1
    @status = "ongoing"
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    puts "#{current_player.name}, c'est à toi de jouer !".magenta
    print "> "
    position = gets.chomp.to_i
    if position < 1 || position > 9 || board.cases[position - 1].value != " "
      puts "Case invalide, veuillez réessayer.".red
      play_turn
    else
      board.play(position - 1, current_player.symbol)
      @status = game_over
      switch_player
    end
  end

  def is_horizontal?
    return(
      (
        if (
             board.cases[0].value == current_player.symbol &&
               board.cases[1].value == current_player.symbol &&
               board.cases[2].value == current_player.symbol
           ) ||
             (
               board.cases[3].value == current_player.symbol &&
                 board.cases[4].value == current_player.symbol &&
                 board.cases[5].value == current_player.symbol
             ) ||
             (
               board.cases[6].value == current_player.symbol &&
                 board.cases[7].value == current_player.symbol &&
                 board.cases[8].value == current_player.symbol
             )
          true
        else
          false
        end
      )
    )
  end
  def is_vertical?
    return(
      (
        if (
             board.cases[0].value == current_player.symbol &&
               board.cases[3].value == current_player.symbol &&
               board.cases[6].value == current_player.symbol
           ) ||
             (
               board.cases[1].value == current_player.symbol &&
                 board.cases[4].value == current_player.symbol &&
                 board.cases[7].value == current_player.symbol
             ) ||
             (
               board.cases[2].value == current_player.symbol &&
                 board.cases[5].value == current_player.symbol &&
                 board.cases[8].value == current_player.symbol
             )
          true
        else
          false
        end
      )
    )
  end

  def is_diagonal?
    return(
      (
        if (
             board.cases[0].value == current_player.symbol &&
               board.cases[4].value == current_player.symbol &&
               board.cases[8].value == current_player.symbol
           ) ||
             (
               board.cases[2].value == current_player.symbol &&
                 board.cases[4].value == current_player.symbol &&
                 board.cases[6].value == current_player.symbol
             )
          true
        else
          false
        end
      )
    )
  end

  def game_over
    if is_horizontal? || is_vertical? || is_diagonal?
      return "victory"
    elsif board.is_full?
      return "draw"
    else
      return "ongoing"
    end
  end

  def play
    puts "Voici le plateau de jeu :".magenta
    puts ""
    while status == "ongoing"
      Show.display_board(board)
      play_turn
    end
    Show.display_board(board)
    if status == "victory"
      puts "#{current_player.name} remporte la partie !".green
    else
      puts "Match nul!".yellow
    end
  end
end
