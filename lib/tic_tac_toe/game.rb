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
      board.move(3, 'O')
      board.move(4, 'O')
      board.move(5, 'O')
      system 'clear'
      board.formatted_grid
      p board.possible_moves
      board.win?
    end
  end
end
