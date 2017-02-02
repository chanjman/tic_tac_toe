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
      "#{current_player.name}: Enter a number between 1 and #{Board::SIZE}"
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def get_move(input = nil)
      until (1..Board::SIZE).cover? input.to_i
        puts solicit_move
        input = validate_input((gets.chomp).to_i)
      end
      input.to_i
    end

    def validate_input(input)
      return position = validate_position(input) if (1..Board::SIZE).cover? input
      p "Error. That is not a number between 1 and #{Board::SIZE}"
      position
    end

    def validate_position(position)
      return position if board.possible_moves.include? (position - 1)
      puts 'That position is not empty.'
    end

    def game_over_message
      case board.game_over?
      when :win
        p "#{current_player.name} won!"
      when :draw
        p "It's a tie."
      end
    end

    def play
      loop do
        system 'clear'
        board.formatted_grid
        puts ''
        movich = get_move
        board.move(movich - 1, current_player.color)
        if board.game_over?
          game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
  end
end
