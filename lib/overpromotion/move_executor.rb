module Overpromotion

  class MoveExecutor

    def initialize(board)
      @board = board
    end

    def execute(player, from, to)
      [@board, :invalid]
    end

  end

end
