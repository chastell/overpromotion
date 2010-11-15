module Overpromotion

  class Game

    def initialize(black, white)
      @board = Board.new
      @players = { black: black.new(@board), white: white.new(@board) }
    end

    def play
      [:black, :white].cycle do |colour|
        move = @players[colour].make_move(@board)
        break unless move
        result = MoveExecutor.new(@board).execute(colour, *move).last
        case result
        when :invalid then redo
        when :winning then break
        end
      end
    end

  end

end
