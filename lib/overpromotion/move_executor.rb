module Overpromotion

  class MoveExecutor

    def initialize(board)
      @board = board
    end

    def execute(player, from, to)
      if MoveValidator.new(@board).valid_move?(player, from, to)
        @board.place_at(to, @board.stone_at(from))
        @board.place_at(from, nil)
        if (player == :black and to.first > 3) or
           (player == :white and to.first < 4)
          @board.stone_at(to).activate!
        end
        if (player == :black and to.first == 0) or
           (player == :white and to.first == 7)
          @board.stone_at(to).deactivate!
          result = :regeneration
        else
          result = :successful
        end
        result = :winning if @board.monotonous?
      else
        result = :invalid
      end
      [@board, result]
    end

  end

end
