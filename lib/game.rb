class Game
  attr_accessor :human_player, :enemies


  # intialize de Game > crée le human player Wolverine et 4 player
  def initialize(name)
    @enemies = []
    @human_player = HumanPlayer.new(name)

    for i in 1..4 do
      @enemies << Player.new(i)
    end

  end

  # WARNING kill le player par l'index de l'array / pas par le nom du player
  def kill_player(player)
    # player_name = @enemies[player].name.index
    # player_index = @enemies.index(player_name) 
    # puts player_index
    # gets.chomp
    @enemies.delete_at(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies.length > 0
  end

  def show_players
    puts "Wolverine a #{@human_player.life_points} points de vie"
    puts "il reste #{@enemies.length} bots fighter"
  end

  def menu_choice(x)

    # créer un array list des index des bots pour les cibler lors de l'attaque / menu_choice du HumanPlayer
    bots_array = []
    @enemies.each_with_index {|bots, idx| bots_array << idx.to_s }

    case x
    
    when "a"
      @human_player.search_weapon
    when "b"  
      @human_player.search_health_pack

    when *bots_array # vérifie l'input gets est inclue dans le arrax index de bots
      humanplayer_attack_selected_bots(x.to_i)
      puts "ca marche"
    else
      puts "wrong command line, try again padawan !"
    end
  end

  # le human player attack le bots choisi - choix par position dans le array
  def humanplayer_attack_selected_bots(x)
    idx = x.to_i
    human_damage = @human_player.compute_damage
    @enemies[idx - 1].gets_damage(human_damage)
    if @enemies[idx - 1].life_points <= 0 
      puts "- le bots #{@enemies[idx - 1].name} est mort"
      kill_player(idx - 1)
    end
    show_bots_state
  end

  def show_bots_state
    "il reste #{@enemies.length} bots player"
    @enemies.each do |bots|
      puts "- le bots #{bots.name} #{bots.life_points} points de vie"
    end
  end


  # lance une attak de tous les bots vivants sur le HumanPlayer
  def enemies_attack
    @enemies.each do |bots_player|
      bots_player.attacks(@human_player)
    end
  end

end


