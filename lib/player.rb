class Player
  attr_accessor :name, :score
  attr_reader :chip
  def initialize(name, chip)
    @name = name
    @chip = chip
    @score = 0
  end
end