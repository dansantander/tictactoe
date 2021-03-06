class Board
  attr_reader :arr
  attr_writer :arr

  def initialize
    @arr = (1..9).to_a
  end

  def full?
    board_full = false
    board_full = true if @arr.all?(String)
    board_full
  end

  def win
    win_arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
               [0, 3, 6], [1, 4, 7], [2, 5, 8],
               [0, 4, 8], [2, 4, 6]]

    win_arr.each do |block|
      return 1 if block.all? { |cell| @arr[cell] == X }
      return 2 if block.all? { |cell| @arr[cell] == O }
    end
    false
  end
end
