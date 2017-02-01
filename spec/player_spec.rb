require_relative "spec_helper.rb"

module TicTacToe
  describe Player do
    context "#initialize" do
      it "raises exception when initialized with empty hash" do
        expect { Player.new() }.to raise_error ArgumentError
      end
      it "does not raise an error when initialized with a valid hash" do
        args = { color: 'X', name: 'John Doe' }
        expect { Player.new(args) }.to_not raise_error
      end
    end

    context "#color" do
      it 'returns the color' do
        args = { color: 'X', name: 'Nivea' }
        player = Player.new(args)
        expect(player.color).to eq 'X'
      end
    end

    context "#name" do
      it 'returns name of the player' do
        args = { color: 'X', name: 'Nivea'}
        player = Player.new(args)
        expect(player.name).to eq 'Nivea'
      end
    end
  end

  describe AI do
    context '#initialize' do
      it 'does not raise exception when initialized with empty hash' do
        expect { AI.new }.not_to raise_error
      end
    end

    context '#name' do
      it 'initializes AI with the name AI' do
        ai = AI.new
        expect(ai.name).to eq 'AI'
      end
    end

    context '#color' do
      it "initializes AI with color 'O'" do
        ai = AI.new
        expect(ai.color).to eq 'O'
      end
    end
  end
end
