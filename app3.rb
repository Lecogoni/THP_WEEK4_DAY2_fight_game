require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|The Ultimate figth game en V3                  |"
puts "-------------------------------------------------"

puts ""

my_game = Game.new("Wolverine")



while my_game.is_still_ongoing?
  
  puts "\n----------------"
  puts my_game.show_players
  puts "----------------"

  puts "\nQuelle action veux-tu effectuer ?"
  puts "\na - chercher une meilleure arme\nb - chercher à se soigner"
  puts "Attaque un bots en le désignant part un chiffre entre 1 et #{my_game.enemies.length}"

  # execute l'action choisit
  puts "\n----------------"
  puts "Que veux tu faire ?"
  x = gets.chomp

  my_game.menu_choice(x)



  # bots player attack
  #puts "\nLes bots players t'attaquent !"
  #my_game.enemies_attack
end

binding.pry