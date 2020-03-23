class Player
  attr_accessor :score
  attr_reader :name, :chip
  def initialize(name, chip)
    @name = name
    @chip = chip
    @score = 0
  end
end