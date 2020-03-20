#!/usr/bin/env ruby
puts "Hello! Welcome to the tic-tac-toe game!"
puts " "
puts "Instructions:"
puts "-Each player chooses a name."
puts "-Each player chooses a symbol (X and O are the all-time classics!)"
puts "-The board is displayed! a 3x3 cells array!"
puts "###BOARD APPEARS HERE###"
puts "-Players take turns to choose a cell, the first one to make a line of symbols wins!"
puts "***Have fun!***"
puts " "
puts " "

puts"Player one, set your name:"
p1_name = gets.chomp
puts"#{p1_name}, choose your symbol:"
p1_symbol = gets.chomp
puts "#{p1_name}, you chose #{p1_symbol} as your weapon!"

puts"Player two, set your name:"
p2_name = gets.chomp
puts"#{p2_name}, choose your symbol:"
p2_symbol = gets.chomp
puts "#{p2_name}, you chose #{p2_symbol} as your weapon!"

puts "#{p1_name} vs #{p2_name}"
puts "###BOARD APPEARS HERE###"
