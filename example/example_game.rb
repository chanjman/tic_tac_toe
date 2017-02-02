require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''

player_1 = TicTacToe::Human.new(color: 'X', name: 'Mario')
player_2 = TicTacToe::Human.new(color: 'O', name: 'Martina')
playerz = [player_1, player_2]
grid = [
  'X', '', '',
  'X', '', '',
  'O', '', ''
]

TicTacToe::Game.new(:players => playerz).play
