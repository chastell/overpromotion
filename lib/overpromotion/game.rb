module Overpromotion

  class Game

    def initialize(black, white)
      @board = Board.new
      @players = { black: black.new(@board), white: white.new(@board) }
    end

  end

end
