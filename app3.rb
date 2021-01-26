require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|The Ultimate figth game en V3                  |"
puts "-------------------------------------------------"

puts ""
puts "Combien bots player souhaites tu créer ? "
print ">"
num_bot_player = gets.chomp.to_i

my_game = Game.new("Wolverine", num_bot_player)



while my_game.is_still_ongoing?
  
  puts "\n----------------"
  puts my_game.show_players
  puts "----------------"
  puts "Quelle action veux-tu effectuer ?"
  puts "\na - chercher une meilleure arme\nb - chercher à se soigner"

  puts ""
  my_game.show_bots_state
  puts ""

  puts "Attaque un bots en le désignant part son numéro entre 1 et #{my_game.enemies.length}"

  # execute l'action choisit
  puts "\n----------------"
  puts "Que veux tu faire ?"
  puts ""
  y = gets.chomp

  if y != "a" && y != "b"
    x = y.to_i - 1
  else
    x = y
  end

  my_game.menu_choice(x)

  # bots player attack
  break if my_game.enemies.length < 1
  
  puts "\nLes bots players t'attaquent !"
  my_game.enemies_attack

end

if my_game.enemies.length < 1
  puts "Bravo #{my_game.human_player.name.capitalize}, tu as gagné "
else
  puts "Dommage #{my_game.human_player.name.capitalize}, tu t'es fait n... par des sales bots ... looser !"
end

binding.pry