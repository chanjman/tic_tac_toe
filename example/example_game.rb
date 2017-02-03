require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''
puts 'First player to move has been randomly selected.'
puts ''

player1 = TicTacToe::Player.new(color: 'X', name: 'Player 1')
player2 = TicTacToe::Player.new(color: 'O', name: 'Player 2')
playerz = [player1, player2]

TicTacToe::Game.new(players: playerz).play
