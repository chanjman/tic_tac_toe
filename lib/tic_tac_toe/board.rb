module TicTacToe
  # Board setup and logic
  class Board
    attr_reader :grid

    DIM = 3
    SIZE = DIM * DIM

    def initialize(grid = nil)
      @grid = grid || Array.new(SIZE) { '-' }
    end

    def move(idx, color)
      grid[idx] = color
    end

    def formatted_grid
      rows = grid.each_slice(DIM).to_a
      rows.each do |row|
        puts row.map.with_index { |cell, idx| cell == '-' ? '[-]' : "[#{cell}]" }.join('  ')
      end
    end

    def possible_moves
      @grid.map.with_index { |p, idx| idx if p == '-' }.compact
    end

    def game_over
      win? || draw?
    end

    def colors
      ['X', 'O']
    end

    def win?
      rows = grid.each_slice(DIM).to_a
      p rows.any? { |row| row.all? { |p| colors.include? p }} ||
        rows.transpose.any? { |col| col.all? { |p| colors.include? p }} ||
        rows.map.with_index.all? { |row, idx| colors.include? row[idx] } ||
        rows.map.with_index.all? { |row, idx| colors.include? row[DIM - 1 - idx] }
    end

    def draw?
      possible_moves.empty?
    end
  end
end
