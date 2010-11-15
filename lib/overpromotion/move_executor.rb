module Overpromotion

  class MoveExecutor

    def initialize(board)
      @board = board
    end

    def execute(player, from, to)
      if MoveValidator.new(@board).valid_move?(player, from, to)
        @board.place_at(to, @board.stone_at(from))
        @board.place_at(from, nil)
        result = :successful
      else
        result = :invalid
      end
      [@board, result]
    end

  end

end
