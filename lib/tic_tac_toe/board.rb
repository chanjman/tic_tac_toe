module TicTacToe
  # Board setup and logic
  class Board
    attr_reader :grid

    def initialize(grid = nil)
      @grid = grid || Array.new(9) { Cell.new }
    end

    def move(idx, turn)
      grid[idx].value = turn
    end

    def formatted_grid
      rows = grid.each_slice(3).to_a
      rows.each do |row|
        puts row.map { |cell| cell == '-' ? '[ ]' : "[#{cell.value}]" }.join('  ')
      end
    end

    def possible_moves
      @grid.map.with_index { |p, idx| idx if p == '-' }.compact
    end
  end
end
