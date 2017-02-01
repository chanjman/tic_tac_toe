require_relative '../lib/tic_tac_toe.rb'

puts 'Welcome to Tic Tac Toe'
puts ''

puts 'Do you wish to play agains human or computer?'
puts 'Press 1 if human, 2 if computer'
choice = gets.chomp

if choice == '1'
  puts 'Player 1, please input your name'
  player_1_name = gets.chomp
  player_1 = TicTacToe::Human.new(color: 'X', name: player_1_name)

  puts 'Player 2, please input your name'
  player_2_name = gets.chomp
  player_2 = TicTacToe::Human.new(color: 'O', name: player_2_name)
else
  puts 'Player 1, please input your name'
  player_1_name = gets.chomp
  player_1 = TicTacToe::Human.new(color: 'X', name: player_1_name)

  player_2 = TicTacToe::AI.new
end

puts "#{player_1_name} is 'X'. #{player_2.name} is 'O'"
players = [player_1, player_2]
TicTacToe::Game.new(players).play
