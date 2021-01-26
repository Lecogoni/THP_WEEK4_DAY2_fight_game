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

  # créer un array list des index des bots pour les cibler lors de l'attaque / menu_choice du HumanPlayer
  def array_of_bots
    bots_array = []
    @enemies.each_with_index {|bots, idx| bots_array << idx }
    puts bots_array
  end

  def menu_choice(x)

    bots_array = []
    @enemies.each_with_index {|bots, idx| bots_array << idx }


    case x
    when "a"
      @human_player.search_weapon
    when "b"
      @human_player.search_health_pack
      
    when bots_array.include?(x)
      puts "ca marche"
    else
      puts "wrong command line, try again padawan !"
    end
    
  end

  def enemies_attack
    @enemies.each do |bots_player|
      bots_player.attacks(@human_player)
    end
  end
end


