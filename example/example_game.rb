require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
mario = TicTacToe::Player.new(color: 'X', name: 'mario')
martina = TicTacToe::Player.new(color: 'O', name: 'martina')
players = [mario, martina]
TicTacToe::Game.new(players).play
