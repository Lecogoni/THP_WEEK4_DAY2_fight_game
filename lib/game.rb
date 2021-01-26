class Game
  attr_accessor :human_player, :enemies


  # intialize de Game > crée le human player Wolverine et 4 player
  def initialize(name, num_bot_player)
    @enemies = []
    @human_player = HumanPlayer.new(name)

    @num_bot_player = num_bot_player
    for i in 1..@num_bot_player do
      @enemies << Player.new(i)
    end

  end

  # WARNING kill le player par l'index de l'array / pas par le nom du player
  def kill_player(player)
    @enemies.delete_at(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies.length > 0
  end

  def show_players
    puts "Wolverine a #{@human_player.life_points} points de vie et une arme de niveau #{@human_player.weapon_level}"
    puts "il reste #{@enemies.length} bots fighter"
  end

  def menu_choice(x)

    # créer un array list des index des bots pour les cibler lors de l'attaque / menu_choice du HumanPlayer
    bots_array = []
    @enemies.each_with_index {|bots, idx| bots_array << idx } #.to_s

    case x
    when "a"
      @human_player.search_weapon
    when "b"  
      @human_player.search_health_pack
    when *bots_array # vérifie l'input gets est inclue dans le arrax index de bots
      humanplayer_attack_selected_bots(x) #.to_i
    else
      puts "wrong command line, try again padawan !"
    end
  end

  # le human player attack le bots choisi - choix par position dans le array
  def humanplayer_attack_selected_bots(x)
    human_damage = @human_player.compute_damage
    @enemies[x].gets_damage(human_damage)
    puts "#{@human_player.name} inflige #{human_damage} point(s) de dégât au bots #{x + 1}"  # #####
    if @enemies[x].life_points <= 0 
      puts "- le bots #{@enemies[x].name} est mort"
      kill_player(x)
    end
    #show_bots_state
  end

  def show_bots_state
    puts "il reste #{@enemies.length} bots player :"
    nbr_good_bots = 0
    @enemies.each_with_index do |bots, idx|
      if bots.life_points == 10
        nbr_good_bots += 1
      elsif bots.life_points != 10
        puts "- le bots #{idx + 1} a #{bots.life_points} points de vie"
      end
    end
    if nbr_good_bots == @enemies.length && nbr_good_bots != 0
      puts "Ils ont tous 10 points de vie"
    elsif nbr_good_bots != 0 && nbr_good_bots != @enemies.length
      puts "- et les #{nbr_good_bots} autre(s) ont 10 points de vie chacun"
    end
  end


  # lance une attak de tous les bots vivants sur le HumanPlayer
  def enemies_attack
    total_bots_damage = 0
    @enemies.each do |bots_player|
      bots_damage = rand(1..6)
      @human_player.gets_damage(bots_damage)
      total_bots_damage += bots_damage
    end
    puts "le(s) #{@enemies.length} inflige(nt) #{total_bots_damage} points de vie a #{@human_player.name}"
  end



end


