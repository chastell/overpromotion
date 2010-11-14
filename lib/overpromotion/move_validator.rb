module Overpromotion

  class MoveValidator

    def initialize(board)
      @board = board
    end

    def valid_move?(player, from, to)
      @player = player
      private_methods(false).grep(/^valid_move_/).all? do |method|
        send(method, from, to)
      end
    end

    private

    def valid_move_in_place(from, to)
      from != to
    end

    def valid_move_no_capturing_of_own_stones(from, to)
      @board.empty?(*to) or @board.stone_at(*to).colour != @player
    end

    def valid_move_stone_exists(from, to)
      not @board.empty?(*from)
    end

    def valid_move_stone_owned(from, to)
      @board.stone_at(*from).colour == @player
    end

  end

end
