# spec/tictactoe_spec.rb
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/gamelogic.rb'
require 'colorize'

describe Board do
  let(:board) { Board.new }
  X = 'X'.green
  O = 'O'.blue

  describe '#win' do
    it 'checks win for three X marks across top row' do
      board.arr = [X, X, X, 4, 5, 6, 7, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across middle row' do
      board.arr = [1, 2, 3, X, X, X, 7, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across bottom row' do
      board.arr = [1, 2, 3, 4, 5, 6, X, X, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across left column' do
      board.arr = [X, 2, 3, X, 5, 6, X, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across middle column' do
      board.arr = [1, X, 3, 4, X, 6, 7, X, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across right column' do
      board.arr = [1, 2, X, 4, 5, X, 7, 8, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across right to left diagonal' do
      board.arr = [1, 2, X, 4, X, 6, X, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three X marks across left to right diagonal' do
      board.arr = [X, 2, 3, 4, X, 6, 7, 8, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three O marks across top row' do
      board.arr = [O, O, O, 4, 5, 6, 7, 8, 9]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across middle row' do
      board.arr = [1, 2, 3, O, O, O, 7, 8, 9]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across bottom row' do
      board.arr = [1, 2, 3, 4, 5, 6, O, O, O]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across left column' do
      board.arr = [O, 2, 3, O, 5, 6, O, 8, 9]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across middle column' do
      board.arr = [1, O, 3, 4, O, 6, 7, O, 9]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across right column' do
      board.arr = [1, 2, O, 4, 5, O, 7, 8, O]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across right to left diagonal' do
      board.arr = [1, 2, O, 4, O, 6, O, 8, 9]
      expect(board.win).to eql(2)
    end

    it 'checks win for three O marks across left to right diagonal' do
      board.arr = [O, 2, 3, 4, O, 6, 7, 8, O]
      expect(board.win).to eql(2)
    end

    it 'returns false if none of the players won' do
      board.arr = [X, O, X, X, O, O, O, X, X]
      expect(board.win).to eql(false)
    end
  end

  describe '#full?' do
    it 'checks if the board is full (none of the players won)' do
      board.arr = [X, O, X, X, O, O, O, X, X] # tie case
      expect(board.full?).to eql(true)
    end

    it 'returns false if board is empty' do
      board.arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.full?).to eql(false)
    end
  end
end

describe GameLogic do
  let(:game) { GameLogic.new }
  let(:board) { Board.new }
  let(:p1) { Player.new('Dan', X) }
  let(:p2) { Player.new('Rod', O) }

  describe '#valid user name input' do
    it "checks if player's name is not an alphabet string" do
      expect(game.valid_name_input('1')).to eql(false)
    end

    it "checks if player's name is not empty" do
      expect(game.valid_name_input('')).to eql(false)
    end

    it "returns true if player's name is valid" do
      expect(game.valid_name_input('Dan')).to eql(true)
    end
  end

  describe '#winner' do
    it "returns which player wins the match in it's due color" do
      board.arr = [X, X, X, O, X, O, O, O, X] # player 1 wins
      expect(game.winner(p1, p2, board)).to eql(p1.name.green)
    end

    it "returns which player wins the match in it's due color" do
      board.arr = [O, O, O, X, O, X, X, X, O] # player 2 wins
      expect(game.winner(p1, p2, board)).to eql(p2.name.blue)
    end

    it 'returns false if none of the players won the match' do
      board.arr = [X, O, X, X, O, O, O, X, X] # tie case
      expect(game.winner(p1, p2, board)).to eql(false)
    end
  end

  describe '#score' do
    it 'adds up score when a player wins' do
      p1.score = 0
      p2.score = 1
      board.arr = [X, X, X, O, X, O, O, O, X] # player 1 wins
      expect(game.score(p1, p2, board)).to eql(1)
    end

    it 'adds up score when a player wins' do
      p1.score = 1
      p2.score = 1
      board.arr = [O, O, O, X, O, X, X, X, O] # player 2 wins
      expect(game.score(p1, p2, board)).to eql(2)
    end

    it 'returns false and leaves score as it is if none of the players won' do
      p1.score = 5
      p2.score = 3
      board.arr = [X, O, X, X, O, O, O, X, X] # tie case
      expect(game.score(p1, p2, board)).to eql(false)
    end
  end
end
