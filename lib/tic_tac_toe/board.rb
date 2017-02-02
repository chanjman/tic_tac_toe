module TicTacToe
  # Board setup and logic
  class Board
    attr_reader :grid

    DIM = 3
    SIZE = DIM * DIM

    def initialize(grid = nil)
      @grid = grid || Array.new(SIZE) { '' }
    end

    def move(idx, color)
      grid[idx] = color
    end

    def get_grid_value(idx)
      grid[idx]
    end

    def formatted_grid
      rows.each do |row|
        puts row.map { |cell| cell == '' ? '[-]' : "[#{cell}]" }.join('  ')
      end
    end

    def possible_moves
      @grid.map.with_index { |p, idx| idx if p == '' }.compact
    end

    def game_over?
      return :win if win?
      return :draw if draw?
      false
    end

    private

    def win?
      winning_positions.any? do |wp|
        next if wp.all_empty?
        wp.all_same?
      end
    end

    def draw?
      possible_moves.empty?
    end

    def rows
      grid.each_slice(DIM).to_a
    end

    def winning_positions
      rows +
        rows.transpose +
        diagonals
    end

    def diagonals
      [
        rows.each_with_index.map { |row, idx| row[idx] },
        rows.each_with_index.map { |row, idx| row[DIM - 1 - idx] }
      ]
    end
  end
end
