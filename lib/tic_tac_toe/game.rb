module TicTacToe
  # Tracks the gameplay
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 9"
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def play
      board.formatted_grid
      system 'clear'
      #p board.winning_positions
      board.move(0, 'X')
      #board.move(1, 'X')
      #board.move(2, 'X')
      board.move(3, 'O')
      #board.move(4, 'O')
      #board.move(5, 'X')
      board.move(6, 'O')
      #board.move(7, 'X')
      #board.move(8, 'O')
      board.formatted_grid
      p board.game_over?
      #board.formatted_grid
      #p board.turn
    end
  end
end
