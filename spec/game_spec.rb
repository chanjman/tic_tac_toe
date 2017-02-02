require_relative 'spec_helper.rb'

module TicTacToe
  describe Game do
    let(:mario) { Player.new(color: 'X', name: 'mario') }
    let(:martina) { Player.new(color: 'O', name: 'martina') }
    let(:game) { Game.new(players: [mario, martina]) }

    context '#initialize' do
      it 'randomly selects a current_player' do
        allow_any_instance_of(Array).to receive(:shuffle) { [mario, martina] }
        expect(game.current_player).to eq(mario)
      end

      it 'randomly selects other player' do
        allow_any_instance_of(Array).to receive(:shuffle) { [mario, martina] }
        expect(game.other_player).to eq(martina)
      end
    end

    context '#switch_players' do
      it 'will set @current_player to @other_player' do
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq(other_player)
      end

      it 'will set @other_player to @current_player' do
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq(current_player)
      end
    end

    context '#solicit_move' do
      it 'asks the player to make a move' do
        allow(game).to receive(:current_player) { mario }
        expected = 'mario: Enter a number between 1 and 9.'
        expect(game.solicit_move).to eq(expected)
      end

      it 'changes message accordingly to board SIZE' do
        stub_const('TicTacToe::Board::SIZE', 25)
        allow(game).to receive(:current_player) { mario }
        expected = 'mario: Enter a number between 1 and 25.'
        expect(game.solicit_move).to eq(expected)
      end
    end

    context '#game_over_message' do
      it "returns '{current_player name} won!' if board show a winner" do
        allow(game).to receive(:current_player) { mario }
        allow(game.board).to receive(:game_over?) { :win }
        expect { game.game_over_message }.to output(/mario won!/).to_stdout
      end

      it "returns 'The game ended in a tie.' if board shows a draw" do
        allow(game).to receive(:current_player) { mario }
        allow(game.board).to receive(:game_over?) { :draw }
        expect { game.game_over_message }.to output(/It's a tie./).to_stdout
      end
    end

    context '#get_move' do
      it 'prompts the user to enter the number again if it is NaN' do
        allow(game).to receive(:gets).and_return('qwerty')
        allow(game).to receive(:loop).and_yield
        expect { game.get_move }
          .to output(/Error. That is not a number between 1 and 9./)
          .to_stdout
      end

      it 'prompts the user to enter the number again if it is not 1-9' do
        allow(game).to receive(:gets).and_return('12345')
        allow(game).to receive(:loop).and_yield
        expect { game.get_move }
          .to output(/Error. That is not a number between 1 and 9./)
          .to_stdout
      end

      it 'changes message accordingly to board SIZE' do
        stub_const('TicTacToe::Board::SIZE', 25)
        allow(game).to receive(:gets).and_return('12345')
        allow(game).to receive(:loop).and_yield
        expect { game.get_move }
          .to output(/Error. That is not a number between 1 and 25./)
          .to_stdout
      end

      it 'returns the move as integer when entered correctly' do
        allow(game).to receive(:gets).and_return('1')
        allow(game).to receive(:loop).and_yield
        expect(game.get_move).to eq 1
      end

      it "returns 'That position is not empty.' if input position not empty" do
        grid = [
          'X', 'O', 'X',
          '',  '',  'O',
          '',  'X', 'O'
        ]
        game = Game.new(players: [mario, martina], board: Board.new(grid))
        allow(game).to receive(:gets).and_return('1')
        allow(game).to receive(:loop).and_yield
        expect { game.get_move }
          .to output(/That position is not empty./)
          .to_stdout
      end
    end
  end
end
