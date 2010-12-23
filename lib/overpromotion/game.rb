module Overpromotion class Game

  def initialize black = Player, white = Player
    @board = Board.new
    @players = { black: black.new(@board), white: white.new(@board) }
  end

  def play
    [:black, :white].cycle do |colour|
      move = @players[colour].make_move @board
      break unless move

      @board, result = *MoveExecutor.new(@board).execute(colour, *move)

      case result
      when :invalid then redo
      when :winning then break
      when :regeneration
        empty = @board.empty_fields({white: 0, black: 7}[colour])
        field = @players[colour].regenerate? empty
        @board.place_at field, Stone.new(colour) if empty.include? field
      end
    end
  end

end end
