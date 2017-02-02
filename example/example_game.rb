require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''

player1 = TicTacToe::Human.new(color: 'X', name: 'Mario')
player2 = TicTacToe::Human.new(color: 'O', name: 'Martina')
playerz = [player1, player2]

TicTacToe::Game.new(players: playerz).play
