#!/usr/bin/env ruby
class Player
  attr_accessor :name, :score
  attr_reader :chip
  def initialize(name, chip)
    @name = name
    @chip = chip
    @score = 0
  end
end

class Board
  attr_accessor :arr

  def initialize
    @arr = (1..9).to_a
  end

  def print
    puts " #{@arr[0]} | #{@arr[1]} | #{@arr[2]} "
    puts '---+---+---'
    puts " #{@arr[3]} | #{@arr[4]} | #{@arr[5]} "
    puts '---+---+---'
    puts " #{@arr[6]} | #{@arr[7]} | #{@arr[8]} "
    puts "\n"
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
      return 'Player 1' if block.all? { |cell| @arr[cell] == 'X' }
      return 'Player 2' if block.all? { |cell| @arr[cell] == 'O' }
    end
    false
  end
end

public

def valid_name(name)
  until name[/[a-zA-Z]/]
    puts 'Please, enter a valid name'
    name = gets.chomp
    valid_name(name)
  end
  name.upcase
end

def valid_play_again(input)
  input.downcase!
  if input != 'y' && input != 'n'
    puts "Please only write 'y' or 'n'"
    input = gets.chomp
    valid_play_again(input)
  else
    true
  end
end

def turn(player)
  puts "#{player.name}, choose your cell!"
  pick = gets.chomp
  cell = pick.to_i - 1

  if @board.arr[cell] == 'X' || @board.arr[cell] == 'O' || !pick[/\d/]
    puts 'Invalid cell, please choose a number between 1 and 9!'
    @board.print
    turn(player)
  else
    puts "#{player.chip} on cell #{pick}!"
    @board.arr[cell] = player.chip
    @board.print
  end
end

def play(player1, player2)
  @board = Board.new
  @board.print

  until @board.full? || @board.win
    turn(player1)
    break if @board.full? || @board.win

    turn(player2)
  end
end

def results
  # needs finnesing
  if @board.win
    puts "And the winner is: #{@board.win}!  You rock!"
    @board.print
  elsif @board.full?
    puts "It's a draw! #{p1.chip}, #{p2.chip} what a wonderful battle of wits!"
    @board.print
  end
end

puts 'Hello! Welcome to the tic-tac-toe game!'
puts ''
puts 'Instructions:'
puts '-Each player chooses a name.'
puts '-Each player chooses a symbol (X and O are the all-time classics!)'
puts '-The board is displayed! a 3x3 cells array! Choose by number!'
puts '###BOARD APPEARS HERE###'
puts '-Players take turns to choose a cell, the first one to make a line of symbols wins!'
puts '***Have fun!***'
puts ''
puts ''

puts 'Player one, type in your name:'
p1_name = gets.chomp
name1 = valid_name(p1_name)
# X = 'X'
p1 = Player.new(name1, 'X')
puts "#{p1.name}, you chose #{p1.chip} as your weapon!"

puts 'Player two, type in your name:'
p2_name = gets.chomp
name2 = valid_name(p2_name)
# O = 'O'
p2 = Player.new(name2, 'O')
puts "#{p2.name}, you chose #{p2.chip} as your weapon!"

puts "#{p1_name} vs #{p2_name}"

play(p1, p2)
# here goes the method for showing results

puts 'You wanna play again? [y/n]'
play_again = gets.chomp
valid_input = valid_play_again(play_again)

unless valid_input
  # needs finessing
  if play_again == 'y'
  # initialize a new game
  else
    puts 'Ok! See ya!'
  end
end
