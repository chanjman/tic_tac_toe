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

    def play
      board.formatted_grid
      board.move(3, 'x')
      system 'clear'
      board.formatted_grid
    end
  end
end
