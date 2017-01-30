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
end
