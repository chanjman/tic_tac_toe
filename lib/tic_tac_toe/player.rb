module TicTacToe
  # Player class to track name and color
  class Player
    attr_reader :color, :name

    def initialize(args)
      @color = args[:color]
      @name = args[:name]
    end
  end

  class Human < Player
  end

  # AI player
  class AI < Player
    def initialize
      @color = 'O'
      @name = 'AI'
    end
  end
end
