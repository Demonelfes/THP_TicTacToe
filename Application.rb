require "colorize"
require_relative "lib/Game.rb"
require_relative "lib/Board.rb"
require_relative "lib/BoardCase.rb"
require_relative "lib/Player.rb"
require_relative "lib/Show.rb"

class Application
  def perform
    puts "Bienvenue dans le jeu du Morpion !".red
    puts ""
    loop do
      Game.new.play
      puts ""
      puts "Voulez-vous refaire une partie ? (O/N)".cyan
      print "> "
      answer = gets.chomp.upcase
      until answer == "O" || answer == "N"
        puts "Réponse invalide, veuillez réessayer. (O/N)".red
        print "> "
        answer = gets.chomp.upcase
      end
      break if answer == "N"
    end
    puts "Merci d'avoir joué, à bientôt !".cyan
  end
end
Application.new.perform
