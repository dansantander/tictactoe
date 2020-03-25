#spec/tictactoe_spec.rb
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/gamelogic.rb'
require 'colorize'

describe Board do 
  let(:board) { Board.new }
  X = 'X'.green
  O = 'O'.blue

  describe '#win' do
    it 'checks win for three marks across top row' do
      board.arr = [X, X, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across middle row' do
      board.arr = [1, 2, 3, X, X, X, 7, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across bottom row' do
      board.arr = [1, 2, 3, 4, 5, 6, X, X, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across left column' do
      board.arr = [X, 2, 3, X, 5, 6, X, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across middle column' do
      board.arr = [1, X, 3, 4, X, 6, 7, X, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across right column' do
      board.arr = [1, 2, X, 4, 5, X, 7, 8, X]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across right to left diagonal' do
      board.arr = [1, 2, X, 4, X, 6, X, 8, 9]
      expect(board.win).to eql(1)
    end

    it 'checks win for three marks across left to right diagonal' do
      board.arr = [X, 2, 3, 4, X, 6, 7, 8, X]
      expect(board.win).to eql(1)
    end 
  end

  describe 'full?' do
    it 'checks if the board is full (none of the players won)' do
      board.arr = [X, O, X, X, O, O, O, X, X]
      expect(board.full?).to eql(true)
    end

    it 'returns false if board is empty' do
      board.arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.full?).to eql(false)
    end
  end
end