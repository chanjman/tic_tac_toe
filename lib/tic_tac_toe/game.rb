module TicTacToe
  # Tracks the gameplay
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "It's #{current_player.name}'s turn; Enter a number between 1 and 9"
    end

    def player_input
      input = get_move
      until check_if_move_valid(input)
        puts "Wrong! #{current_player.name}, please input a number between 1 and 9"
        input = get_move
      end
      until check_if_cell_empty(move_to_coordinate(input))
        puts 'Wrong, cell not empty! Try again'
        input = get_move
      end
      move_to_coordinate(input)
    end

    def get_move
      gets.chomp
    end

    def move_to_coordinate(move)
      mapping = {
        '1' => [0, 0],
        '2' => [0, 1],
        '3' => [0, 2],
        '4' => [1, 0],
        '5' => [1, 1],
        '6' => [1, 2],
        '7' => [2, 0],
        '8' => [2, 1],
        '9' => [2, 2]
      }
      mapping[move]
    end

    def check_if_cell_empty(cell)
      board.get_cell(cell[0], cell[1]).value.empty?
    end

    def check_if_move_valid(move)
      valid_move.include? move
    end

    def valid_move
      Array('1'..'9')
    end

    def game_over_message
      case board.game_over
      when :winner
        "#{current_player.name} won!"
      when :draw
        'The game ended in a tie.'
      end
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      puts ''
      loop do
        system 'clear'
        board.formatted_grid
        puts ''
        puts solicit_move
        x, y = player_input
        board.set_cell(x, y, current_player.color)
        if board.game_over
          system 'clear'
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
  end
end
