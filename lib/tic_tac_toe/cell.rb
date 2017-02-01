module TicTacToe
  # Cell class to keep track of cell values
  class Cell
    attr_accessor :value

    def initialize(value = '-')
      @value = value
    end
  end
end
