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
      "#{current_player.name}: Enter a number between 1 and 9"
    end

    def player_input
      return human_player_input if current_player.class == Human
      ai_input
    end

    def human_player_input
      puts solicit_move
      input = get_human_move
      check_if_move_valid(input)
    end

    def ai_input
      input = (1 + rand(9)).to_s
      check_if_move_valid(input)
    end

    def get_human_move
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
      if board.get_cell(cell[0], cell[1]).value.empty?
        cell
      else
        cell_not_empty
      end
    end

    def check_if_move_valid(move)
      if valid_move.include? move
        check_if_cell_empty(move_to_coordinate(move))
      else
        invalid_move
      end
    end

    def valid_move
      Array('1'..'9')
    end

    def invalid_move
      puts 'Sorry, but that is invalid move.' if current_player.class == Human
      player_input
    end

    def cell_not_empty
      puts 'Sorry, but that cell is not empty.' if current_player.class == Human
      player_input
    end

    def get_empty_cells
      empty_cells = []
      board.grid.map do |row|
        row.map { |cell| empty_cells << cell if cell.value.empty? }
      end
      empty_cells
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
