module Overpromotion

  class MoveValidator

    def initialize(board)
      @board = board
    end

    def valid_move?(player, from, to)
      @player = player
      valid_move_stone_exists(from, to) and valid_move_stone_owned(from, to)
    end

    private

    def valid_move_stone_exists(from, to)
      not @board.stone_at(*from).nil?
    end

    def valid_move_stone_owned(from, to)
      @board.stone_at(*from).colour == @player
    end

  end

end
