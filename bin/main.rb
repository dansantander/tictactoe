#!/usr/bin/env ruby
load '../lib/player.rb'
load '../lib/board.rb'
require 'colorize'

public

def valid_name(name)
  if name[/[^a-zA-Z]/]
    puts 'Please, enter a valid name'.red
    name = gets.chomp
    valid_name(name)
  else
    name.upcase
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
    @board.print
    turn(player)
  else
    puts "#{player.chip} on cell #{pick}!"
    puts ''
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
X = 'X'.green
p1 = Player.new(name1, X)
puts "#{p1.name}, you chose #{p1.chip} as your weapon!"

puts 'Player two, type in your name:'
p2_name = gets.chomp
name2 = valid_name(p2_name)
O = 'O'.blue
p2 = Player.new(name2, O)
puts "#{p2.name}, you chose #{p2.chip} as your weapon!"

puts "#{p1_name} vs #{p2_name}"

play(p1, p2)
results

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
