require_relative 'spec_helper.rb'

module TicTacToe
  describe Game do
    let(:mario) { Player.new(color: 'X', name: 'mario') }
    let(:martina) { Player.new(color: 'O', name: 'martina') }

    context '#initialize' do
      it 'randomly selects a current_player' do
        allow_any_instance_of(Array).to receive(:shuffle) { [mario, martina] }
        game = Game.new([martina, mario])
        expect(game.current_player).to eq(mario)
      end

      it 'randomly selects other player' do
        allow_any_instance_of(Array).to receive(:shuffle) { [mario, martina] }
        game = Game.new([martina, mario])
        expect(game.other_player).to eq(martina)
      end
    end

    context '#switch_players' do
      it 'will set @current_player to @other_player' do
        game = Game.new([mario, martina])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq(other_player)
      end

      it 'will set @other_player to @current_player' do
        game = Game.new([mario, martina])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq(current_player)
      end
    end

    context '#solicit_move' do
      it 'asks the player to make a move' do
        game = Game.new([mario, martina])
        allow(game).to receive(:current_player) { mario }
        expected = "mario: Enter a number between 1 and 9"
        expect(game.solicit_move).to eq(expected)
      end
    end

    context '#get_move' do
      it 'converts human_move of 1 to [0, 0]' do
        game = Game.new([mario, martina])
        expect(game.move_to_coordinate('1')).to eq([0, 0])
      end

      it 'converts human move of 5 to [1, 1]' do
        game = Game.new([mario, martina])
        expect(game.move_to_coordinate('5')).to eq([1, 1])
      end
    end

    context '#game_over_message' do
      it "returns '{current_player name} won!' if board show a winner" do
        game = Game.new([mario, martina])
        allow(game).to receive(:current_player) { mario }
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq('mario won!')
      end

      it "returns 'The game ended in a tie.' if board shows a draw" do
        game = Game.new([mario, martina])
        allow(game).to receive(:current_player) { mario }
        allow(game.board).to receive(:game_over) { :draw }
        expect(game.game_over_message).to eq 'The game ended in a tie.'
      end
    end

    context '#invalid_move' do
      it 'returns false input is not between 1 and 9' do
        game = Game.new([mario, martina])
        allow(game).to receive(:current_player) { mario }
        expect(game.check_if_move_valid('54')).to be_falsey
      end

      it 'returns false if input is not a number' do
        game = Game.new([mario, martina])
        allow(game).to receive(:current_player) { mario }
        expect(game.check_if_move_valid('r')).to be_falsey
      end
    end
  end
end
