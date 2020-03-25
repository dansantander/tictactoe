class GameLogic
  def valid_name_input(input)
    if input[/[^a-zA-Z]/] || input == ''
      false
    else
      true
    end
  end

  def winner(player1, player2, board)
    if board.win == 1
      player1.name.green
    elsif board.win == 2
      player2.name.blue
    else
      false
    end
  end

  def score (player1, player2, board)
    if board.win == 1
      player1.score += 1
    elsif board.win == 2
      player2.score += 1
    else
      false
    end
  end
end
