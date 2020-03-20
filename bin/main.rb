#!/usr/bin/env ruby
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

puts 'Player one, set your name:'
p1_name = gets.chomp
puts "#{p1_name}, choose your symbol:"
p1_symbol = gets.chomp
puts "#{p1_name}, you chose #{p1_symbol} as your weapon!"

puts 'Player two, set your name:'
p2_name = gets.chomp
puts "#{p2_name}, choose your symbol:"
p2_symbol = gets.chomp
puts "#{p2_name}, you chose #{p2_symbol} as your weapon!"

puts "#{p1_name} vs #{p2_name}"
puts '###BOARD APPEARS HERE###'

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
