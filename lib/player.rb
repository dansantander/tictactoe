class Player
  attr_writer :score
  attr_reader :name, :chip, :score
  def initialize(name, chip)
    @name = name
    @chip = chip
    @score = 0
  end
end
