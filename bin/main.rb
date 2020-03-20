#!/usr/bin/env ruby
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

    if @board.arr[cell] == X || @board.arr[cell] == O || !pick[/\d/] 
      puts 'Invalid cell, please choose a number between 1 and 9!'
      @board.print
      self.turn(player)
    else
      puts "#{player.chip} on cell #{pick}!"
      @board.arr[cell] = player.chip
      @board.print
    end
end

def play (player1, player2)
  @board = Board.new
  @board.print

  until @board.full? || @board.win
    t1 = turn(player1)
    break if @board.full? || @board.win
    t2 = turn(player2)
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
X = "X".green
p1 = Player.new(name1, X)
puts "#{p1.name}, you chose #{p1.chip} as your weapon!"

puts 'Player two, type in your name:'
p2_name = gets.chomp
name2 = valid_name(p2_name) 
O = "O".blue
p2 = Player.new(name2, O)
puts "#{p2.name}, you chose #{p2.chip} as your weapon!"

puts "#{p1_name} vs #{p2_name}"

self.play(p1, p2)


playing = true

while playing
  puts "#{p1_name}, choose your cell!"
  p1_play = gets.chomp
  puts "#{p1_symbol} on cell #{p1_play}!"

  puts "#{p2_name}, choose your cell!"
  p2_play = gets.chomp
  puts "#{p2_symbol} on cell #{p2_play}!"

  puts 'The game so far...'
  puts '###UPDATED BOARD HERE###'

  if resolution == 'win'
    playing = false
    puts "Winner is: #{winner_name}. #{winner_symbol} reigns!"
    puts '###FINAL BOARD###'
  elsif resolution == 'draw'
    playing = false
    puts "It's a draw! #{p1_symbol}, #{p2_symbol} what a wonderful battle of wits!"
    puts '###FINAL BOARD###'
  end
end

puts 'You wanna play again? [y/n]'
play_again = gets.chomp
valid_input = valid_play_again(play_again)
unless valid_input
  if play_again == 'y'
  # initialize board array
  else
    puts 'Ok! See ya!'
  end
end
