module Overpromotion

  class Game

    def initialize(black, white)
      @board = Board.new
      @players = { black: black.new(@board), white: white.new(@board) }
    end

    def play
      [:black, :white].cycle do |colour|
        move = @players[colour].make_move
        break unless move
      end
    end

  end

end
