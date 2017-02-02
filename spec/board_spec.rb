require_relative 'spec_helper.rb'

module TicTacToe
  describe Board do
    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { Board.new }.not_to raise_error
      end

      it 'sets the grid with 9 positions by default' do
        board = Board.new
        expect(board.grid.size).to eq(9)
      end
    end

    context '#get_grid_value' do
      it 'returns the value of desired grid position' do
        grid = ['w', '', '', '', 'r', '', '', '', 'u']
        board = Board.new(grid)
        expect(board.get_grid_value(4)).to eq('r')
      end
    end

    context '#move' do
      it "sets grid position 'idx' to value 'color'" do
        board = Board.new
        board.move(4, 'train station')
        expect(board.get_grid_value(4)).to eq('train station')
      end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new('X') }
    let(:o_cell) { TestCell.new('O') }
    let(:empty) { TestCell.new('') }

    context '#game_over?' do
      it 'returns :win if win? is true' do
        board = Board.new
        allow(board).to receive(:win?) { true }
        expect(board.game_over?).to eq :win
      end

      it 'returns :draw if win? is false and draw? is true' do
        board = Board.new
        allow(board).to receive(:win?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over?).to eq :draw
      end

      it 'returns false if win? is false and draw? is false' do
        board = Board.new
        allow(board).to receive(:win?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over?).to be_falsey
      end

      it 'returns :win when row has has objects of same value' do
        grid = [
          x_cell, x_cell, x_cell,
          x_cell, o_cell, o_cell,
          o_cell, o_cell, empty
        ]
        board = Board.new(grid)
        expect(board.game_over?).to eq :win
      end

      it 'returns :win when column has objects of same value' do
        grid = [
          x_cell, o_cell, x_cell,
          x_cell, o_cell, o_cell,
          x_cell, x_cell, empty
        ]
        board = Board.new(grid)
        expect(board.game_over?).to eq :win
      end

      it 'returns :win when diagonal has objects of same value' do
        grid = [
          x_cell, o_cell, o_cell,
          o_cell, x_cell, o_cell,
          empty, x_cell, x_cell
        ]
        board = Board.new(grid)
        expect(board.game_over?).to eq :win
      end

      it 'returns :draw when all spaces on the board are taken' do
        grid = [
          x_cell, o_cell, x_cell,
          x_cell, o_cell, o_cell,
          o_cell, x_cell, x_cell
        ]
        board = Board.new(grid)
        expect(board.game_over?).to eq :draw
      end

      it 'returns false when there is no winner or draw' do
        grid = [
          'X', '', '',
          'X', '', '',
          'O', '', ''
        ]
        board = Board.new(grid)
        expect(board.game_over?).to be_falsey
      end
    end
  end
end
