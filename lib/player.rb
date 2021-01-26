# class des joueurs 
class Player

  attr_accessor :name, :life_points, :enemies
  @@enemies = []

  def initialize(name)
    @name = name
    @life_points = 10
    @@enemies << self
  end

  def self.all_player
    @@enemies
  end

  # montre l'état d'un Player
  def show_state
    if self.is_alive? == true
      return "le joueur #{@name.capitalize} est mort"
    else
      return "#{name.capitalize} a #{life_points} points de vie"
    end
  end

  # affiche que le player est mort si life_points < 1
  def is_alive?
    @life_points <= 0
  end

  # calcul les nouveaux life_points du player après les dommages subit
  def gets_damage(num)
    @life_points = @life_points - num
    #self.is_alive?
  end

  # permet de définir les points de dégat qu'un player afflige à un autre lorsqu'il l'attaque
  def attacks(player)
    damage = compute_damage
    puts "#{@name.capitalize} attaque #{player.name.capitalize} et lui inflige #{damage} points de dégat"
    player.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end
  
end

# ######### HUMAN PLAYER #########

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  # montre l'état d'un HumanPlayer
  def show_state
    "#{self.name.capitalize} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  # détermine la valeur de weapon_level selon un lancé de dés
  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      define_weapon_level(new_weapon)
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def define_weapon_level(new_weapon)
    @weapon_level = new_weapon
  end


  # détermine les points de vie gagné par le health pack 
  def search_health_pack
    health_pack = rand(1..6)
    
    if health_pack == 1
      puts  "Tu n'as rien trouvé... "
    elsif health_pack >= 2 && health_pack < 6
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      add_health_pack(50)
    else
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      add_health_pack(50)
    end

  end

  # calcul les points de vie selon le health pack 
  def add_health_pack(health_pack)
    @life_points = life_points + health_pack
    @life_points = 100 if life_points > 100 
    puts " Tu as maintenant #{life_points} point de vie"
  end
  
  
end