module Overpromotion

  class MoveValidator

    def initialize(board)
      @board = board
    end

    def valid_move?(player, from, to)
      not @board.stone_at(*from).nil? and @board.stone_at(*from).colour == player
    end

  end

end
