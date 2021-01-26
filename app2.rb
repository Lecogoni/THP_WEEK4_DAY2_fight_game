require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts ""

puts "Quel est le nom de ton human player ? "
print ">"
human_player = gets.chomp

hp1 = HumanPlayer.new(human_player)

players = [ ] 

players << p1 = Player.new("josé")
players << p2 = Player.new("josiane")



while hp1.life_points > 0 && (p1.life_points > 0 || p2.life_points > 0 )

# menu de lancement - demande le nom du human player, choix d'action

  puts "\n----------------"
  puts hp1.show_state
  puts "----------------"

  puts "\nQuelle action veux-tu effectuer ?"
  puts "\na - chercher une meilleure arme\nb - chercher à se soigner"

  puts"\nAttaquer un joueur en vue :"
  puts "c - #{p1.show_state}\nd - #{p2.show_state}"

# execute l'action choisit
  puts "\n----------------"
  puts "Que veux tu faire ?"
  x = gets.chomp

  case x
  when "a"
    hp1.search_weapon
  when "b"
    hp1.search_health_pack
  when "c"
    hp1.attacks(p1)
  when "d"
    hp1.attacks(p2)
  else
    puts "wrong command line, try again padawan !"
  end

  puts "\nLes autres joueurs t'attaquent !"
  gets.chomp
  players.each do |player|
    if player.life_points > 0
      player.attacks(hp1)
    end
  end

end

puts "La partie est finie"
if hp1.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end

binding.pry
