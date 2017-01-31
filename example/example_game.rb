require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''
puts 'Player 1, please input your name'
player_1_name = gets.chomp
player_1 = TicTacToe::Human.new(color: 'X', name: player_1_name)

puts 'Player 2, please input your name'
player_2_name = gets.chomp
player_2 = TicTacToe::Human.new(color: 'O', name: player_2_name)

puts "#{player_1_name} is 'X'. #{player_2_name} is 'O'"
players = [player_1, player_2]
TicTacToe::Game.new(players).play
