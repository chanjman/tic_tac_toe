require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''

player_1 = TicTacToe::Human.new(color: 'X', name: 'Mario')
player_2 = TicTacToe::Human.new(color: 'O', name: 'Martina')
players = [player_1, player_2]

TicTacToe::Game.new(players).play
