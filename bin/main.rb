#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/gamelogic.rb'
require 'colorize'

public

def valid_name(name)
  logic = GameLogic.new
  valid = logic.valid_name_input(name)
  if !valid
    puts 'Please, enter a valid name'.red
    name = gets.chomp
    valid_name(name)
  else
    name.upcase
  end
end

def valid_play_again(input)
  input.downcase!
  if input != 'y' && input != 'n'
    puts "Please only write 'y' or 'n'".red
    input = gets.chomp
    valid_play_again(input)
  else
    input
  end
end

def turn(player)
  puts "#{player.name}, choose your cell!"
  pick = gets.chomp
  cell = pick.to_i - 1

  if @board.arr[cell] == X || @board.arr[cell] == O || !pick[/\d/]
    puts 'Invalid cell, please choose a number between 1 and 9!'.red
    puts ''
    print_board(@board.arr)
    turn(player)
  else
    puts "#{player.chip} on cell #{pick}!"
    puts ''
    @board.arr[cell] = player.chip
    print_board(@board.arr)
  end
end

def print_board(arr)
  puts " #{arr[0]} | #{arr[1]} | #{arr[2]} "
  puts '---+---+---'
  puts " #{arr[3]} | #{arr[4]} | #{arr[5]} "
  puts '---+---+---'
  puts " #{arr[6]} | #{arr[7]} | #{arr[8]} "
  puts "\n"
end

def play(player1, player2)
  @board = Board.new
  print_board(@board.arr)

  until @board.full? || @board.win
    turn(player1)
    break if @board.full? || @board.win

    turn(player2)
  end
end

def results(player1, player2)
  logic = GameLogic.new
  winner = logic.winner(player1, player2, @board)
  score = logic.score(player1, player2, @board)
  if @board.win
    puts "And the winner is: #{winner}!  You rock!"
    puts "Current score is: #{player1.name.green}: #{player1.score} vs  #{player2.name.blue}: #{player2.score}"
    puts ''
    print_board(@board.arr)
  elsif @board.full?
    puts "It's a draw! #{player1.name.green}, #{player2.name.blue}: What a wonderful battle of wits!"
    puts "Current score is: #{player1.name.green}: #{player1.score} vs  #{player2.name.blue}: #{player2.score}"
    puts ''
    print_board(@board.arr)
  end
end

puts 'Hello! Welcome to the tic-tac-toe game!'.green
puts ''
puts 'Instructions:'
puts '-Each player chooses a name.'
puts '-Each player gets a symbol (X and O are the all-time classics!)'
puts '-The board is displayed! a 3x3 cells array! Choose by number!'
puts '-Players take turns to choose a cell, the first one to make a line of symbols wins!'
puts '***Have fun!***'
puts ''
puts ''

puts 'Player one, type in your name:'.green
p1_name = gets.chomp
name1 = valid_name(p1_name)
X = 'X'.green
p1 = Player.new(name1, X)
puts "#{p1.name.green}, you chose #{p1.chip} as your weapon!"
puts ''

puts 'Player two, type in your name:'.blue
p2_name = gets.chomp
name2 = valid_name(p2_name)
O = 'O'.blue
p2 = Player.new(name2, O)
puts "#{p2.name.blue}, you chose #{p2.chip} as your weapon!"
puts ''

puts "#{p1.name.green} vs #{p2.name.blue}"
puts ''

playing = true

while playing
  play(p1, p2)
  results(p1, p2)

  puts 'Wanna play again? [y/n]'
  play_again = gets.chomp
  valid_input = valid_play_again(play_again)

  if valid_input == 'y'
    playing
  else
    puts 'Ok! See ya!'
    break
  end
end
