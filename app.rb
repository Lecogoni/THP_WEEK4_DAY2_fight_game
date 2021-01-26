require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = "nico"
player2 = "loupa"
human_player = "monster"

p1 = Player.new(player1)
p2 = Player.new(player2)
hp1 = HumanPlayer.new(human_player)

binding.pry

puts "Voici l'état de chaque joueur : \n\n"
p1.show_state
p2.show_state


while p1.life_points > 0 && p2.life_points > 0 

  puts "\nPassons à la phase d'attaque :"

  p2.attacks(p1)
  break if p1.life_points <= 0
  p1.attacks(p2)

  puts "\n\n Voici l'état de chaque joueur :"
  p1.show_state
  p2.show_state

end





